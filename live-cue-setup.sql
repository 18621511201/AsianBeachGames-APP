-- ═══════════════════════════════════════════════════════════════
--  Live-CUE  ·  Supabase 补充表结构 & 权限配置
--  在 Supabase Dashboard → SQL Editor 中执行此脚本
-- ═══════════════════════════════════════════════════════════════

-- ──────────────────────────────────────────────────────────────
-- 1. PROFILES — 用户档案（关联 Supabase Auth）
-- ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.profiles (
  id          UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email       TEXT,
  full_name   TEXT,
  role        TEXT NOT NULL DEFAULT 'viewer'
              CHECK (role IN ('admin', 'director', 'viewer')),
  avatar_url  TEXT,
  is_active   BOOLEAN DEFAULT true,
  last_seen   TIMESTAMPTZ,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);
COMMENT ON TABLE public.profiles IS '用户档案：admin=管理员, director=导播, viewer=只读';

-- ──────────────────────────────────────────────────────────────
-- 2. ANNOTATIONS — 实时协作备注
-- ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.annotations (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id    UUID REFERENCES public.events(id) ON DELETE CASCADE,
  user_id     UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  user_name   TEXT,
  content     TEXT NOT NULL,
  color       TEXT DEFAULT '#fbbf24',
  is_pinned   BOOLEAN DEFAULT false,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);
COMMENT ON TABLE public.annotations IS '赛事实时协作备注';

-- ──────────────────────────────────────────────────────────────
-- 3. AUDIT_LOGS — 操作历史日志
-- ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.audit_logs (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  user_email  TEXT,
  action      TEXT NOT NULL CHECK (action IN ('create','update','delete','login','import')),
  table_name  TEXT,
  record_id   UUID,
  summary     TEXT,
  old_data    JSONB,
  new_data    JSONB,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);
COMMENT ON TABLE public.audit_logs IS '所有操作的审计日志';

-- ──────────────────────────────────────────────────────────────
-- 4. UPDATED_AT 触发器
-- ──────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END; $$;

DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname='venues_updated_at')
  THEN CREATE TRIGGER venues_updated_at BEFORE UPDATE ON public.venues
       FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at(); END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname='events_updated_at')
  THEN CREATE TRIGGER events_updated_at BEFORE UPDATE ON public.events
       FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at(); END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname='profiles_updated_at')
  THEN CREATE TRIGGER profiles_updated_at BEFORE UPDATE ON public.profiles
       FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at(); END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname='annotations_updated_at')
  THEN CREATE TRIGGER annotations_updated_at BEFORE UPDATE ON public.annotations
       FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at(); END IF;
END $$;

-- ──────────────────────────────────────────────────────────────
-- 5. 新用户自动创建 profile
-- ──────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, role)
  VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email), 'viewer')
  ON CONFLICT (id) DO NOTHING;
  RETURN NEW;
END; $$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ──────────────────────────────────────────────────────────────
-- 6. ROW LEVEL SECURITY
-- ──────────────────────────────────────────────────────────────
ALTER TABLE public.venues      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.events      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profiles    ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.annotations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.audit_logs  ENABLE ROW LEVEL SECURITY;

-- venues: 所有人可读，admin可写
CREATE POLICY IF NOT EXISTS "venues_public_read"  ON public.venues FOR SELECT USING (true);
CREATE POLICY IF NOT EXISTS "venues_admin_write"  ON public.venues FOR ALL
  USING (EXISTS (SELECT 1 FROM public.profiles WHERE id=auth.uid() AND role='admin'));

-- events: 所有人可读，admin/director可写
CREATE POLICY IF NOT EXISTS "events_public_read"  ON public.events FOR SELECT USING (true);
CREATE POLICY IF NOT EXISTS "events_staff_write"  ON public.events FOR ALL
  USING (EXISTS (SELECT 1 FROM public.profiles WHERE id=auth.uid() AND role IN ('admin','director')));

-- profiles: 所有人可读自己的，admin可读全部
CREATE POLICY IF NOT EXISTS "profiles_self_read"  ON public.profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY IF NOT EXISTS "profiles_admin_read" ON public.profiles FOR SELECT
  USING (EXISTS (SELECT 1 FROM public.profiles WHERE id=auth.uid() AND role='admin'));
CREATE POLICY IF NOT EXISTS "profiles_self_update" ON public.profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY IF NOT EXISTS "profiles_admin_all"  ON public.profiles FOR ALL
  USING (EXISTS (SELECT 1 FROM public.profiles WHERE id=auth.uid() AND role='admin'));

-- annotations: 所有人可读，登录用户可写
CREATE POLICY IF NOT EXISTS "annotations_public_read"  ON public.annotations FOR SELECT USING (true);
CREATE POLICY IF NOT EXISTS "annotations_auth_insert"  ON public.annotations FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY IF NOT EXISTS "annotations_owner_update" ON public.annotations FOR UPDATE
  USING (auth.uid() = user_id);
CREATE POLICY IF NOT EXISTS "annotations_owner_delete" ON public.annotations FOR DELETE
  USING (auth.uid() = user_id OR
    EXISTS (SELECT 1 FROM public.profiles WHERE id=auth.uid() AND role='admin'));

-- audit_logs: admin可读
CREATE POLICY IF NOT EXISTS "audit_admin_read" ON public.audit_logs FOR SELECT
  USING (EXISTS (SELECT 1 FROM public.profiles WHERE id=auth.uid() AND role='admin'));

-- ──────────────────────────────────────────────────────────────
-- 7. 开启 Realtime
-- ──────────────────────────────────────────────────────────────
ALTER PUBLICATION supabase_realtime ADD TABLE public.events;
ALTER PUBLICATION supabase_realtime ADD TABLE public.venues;
ALTER PUBLICATION supabase_realtime ADD TABLE public.annotations;

-- ──────────────────────────────────────────────────────────────
-- 完成！接下来在 Supabase → Authentication → Settings
-- 中开启 Email 登录，然后手动创建第一个 admin 账号。
-- ═══════════════════════════════════════════════════════════════
