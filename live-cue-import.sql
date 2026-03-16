-- Live-CUE 2026 Asian Beach Games — Full Schedule Import
-- Generated from 20260311竞赛单元日程(1).xlsx
-- Run in Supabase Dashboard → SQL Editor

-- Clear existing data first
TRUNCATE public.events;
TRUNCATE public.venues CASCADE;

-- ============================================================
-- VENUES (15)
-- ============================================================

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000001', '公开水域游泳', '公开水域', '#0ea5e9', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000002', '水球', '水球', '#06b6d4', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000003', '三人篮球', '3x3篮球', '#f97316', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000004', '沙滩田径', '沙滩田径', '#84cc16', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000005', '龙舟', '龙舟', '#eab308', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000006', '沙滩足球', '沙滩足球', '#22c55e', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000007', '沙滩手球', '沙滩手球', '#a855f7', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000008', '柔术', '柔术', '#ec4899', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000009', '沙滩卡巴迪', '沙滩卡巴迪', '#f43f5e', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000010', '帆船', '帆船', '#3b82f6', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000011', '攀岩', '攀岩', '#8b5cf6', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000012', '台克球', '台克球', '#14b8a6', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000013', '游跑两项', '游跑两项', '#0284c7', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000014', '沙滩排球', '沙滩排球', '#d97706', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

INSERT INTO public.venues (id, name, short_name, color, is_active)
VALUES ('a1000000-0000-0000-0000-000000000015', '沙滩摔跤', '沙滩摔跤', '#dc2626', TRUE)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, short_name = EXCLUDED.short_name, color = EXCLUDED.color, is_active = EXCLUDED.is_active;

-- ============================================================
-- EVENTS (559 total)
-- ============================================================

-- 公开水域游泳 (3 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('9bc63eb6-5132-57b1-a4b4-47e65f007a13', 'a1000000-0000-0000-0000-000000000001', '女子5公里
Women''s 5km', '决赛', 1777078800000, 1777087800000, TRUE, NULL, NULL),
('b3b44ef0-bcdf-5a72-a7d7-1d8f8644fefd', 'a1000000-0000-0000-0000-000000000001', '男子5公里
Men''s 5km', '决赛', 1777165200000, 1777174200000, TRUE, NULL, NULL),
('9616bc04-bb9f-5ef9-9f37-6f430d29c456', 'a1000000-0000-0000-0000-000000000001', '男女混合：4*1.5公里接力
Mixed 4*1.5km Relay', '决赛', 1777251600000, 1777260600000, TRUE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 水球 (27 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('a7436a0c-122d-5ce1-86c5-b7e25c1e4197', 'a1000000-0000-0000-0000-000000000002', '男子水球 第1场 1-6
Men''s Water Polo 第1场 1-6', '单循环决赛', 1776821400000, 1776824100000, TRUE, NULL, NULL),
('a5110126-d935-5423-89d9-451c3591794f', 'a1000000-0000-0000-0000-000000000002', '女子水球 第1场 1-5
Women''s Water Polo 第1场 1-5', '单循环决赛', 1776821400000, 1776824100000, TRUE, NULL, NULL),
('77b244d9-fa59-50c1-98bc-dc87de9f0957', 'a1000000-0000-0000-0000-000000000002', '男子水球 第2场 2-5
Men''s Water Polo 第2场 2-5', '单循环决赛', 1776824100000, 1776826800000, TRUE, NULL, NULL),
('a4a9dfb6-08da-5b1d-9b99-da4bf0654902', 'a1000000-0000-0000-0000-000000000002', '女子水球 第2场 2-4
Women''s Water Polo 第2场 2-4', '单循环决赛', 1776824100000, 1776826800000, TRUE, NULL, NULL),
('75511f4a-35b0-5284-9211-78767d5ffb44', 'a1000000-0000-0000-0000-000000000002', '男子水球 第3场 3-4
Men''s Water Polo 第3场 3-4', '单循环决赛', 1776826800000, 1776829500000, TRUE, NULL, NULL),
('3962851b-9421-56d7-a4c9-84d823f18e44', 'a1000000-0000-0000-0000-000000000002', '女子水球 第3场 5-3
Women''s Water Polo 第3场 5-3', '单循环决赛', 1776907800000, 1776910500000, TRUE, NULL, NULL),
('617a3119-ddef-51ef-97dc-8854eea92d4f', 'a1000000-0000-0000-0000-000000000002', '女子水球 第4场 1-4
Women''s Water Polo 第4场 1-4', '单循环决赛', 1776910500000, 1776913200000, TRUE, NULL, NULL),
('11835a71-4974-5cbe-b271-380431d16b42', 'a1000000-0000-0000-0000-000000000002', '男子水球 第4场 5-3
Men''s Water Polo 第4场 5-3', '单循环决赛', 1776926700000, 1776929400000, TRUE, NULL, NULL),
('a3e83b0e-fa9c-5809-b87a-e4b495a751f6', 'a1000000-0000-0000-0000-000000000002', '男子水球 第5场 1-4
Men''s Water Polo 第5场 1-4', '单循环决赛', 1776929400000, 1776932100000, TRUE, NULL, NULL),
('edb49b79-4cb9-5d04-83e3-9c90c40e4cf7', 'a1000000-0000-0000-0000-000000000002', '男子水球 第6场 6-2
Men''s Water Polo 第6场 6-2', '单循环决赛', 1776933900000, 1776936600000, TRUE, NULL, NULL),
('f9c6e47c-bda1-59dd-9799-3a948f137ca6', 'a1000000-0000-0000-0000-000000000002', '女子水球 第5场 2-3
Women''s Water Polo 第5场 2-3', '单循环决赛', 1776994200000, 1776996900000, TRUE, NULL, NULL),
('b5256898-2632-5ab8-a92c-e4021ad6513b', 'a1000000-0000-0000-0000-000000000002', '女子水球 第6场 4-5
Women''s Water Polo 第6场 4-5', '单循环决赛', 1776996900000, 1776999600000, TRUE, NULL, NULL),
('85b65a8b-0511-59d3-94b2-d0af3c8d3206', 'a1000000-0000-0000-0000-000000000002', '男子水球 第7场 1-5
Men''s Water Polo 第7场 1-5', '单循环决赛', 1777013100000, 1777015800000, TRUE, NULL, NULL),
('48730141-2d5b-50db-bfc3-9cb90e181cea', 'a1000000-0000-0000-0000-000000000002', '男子水球 第8场 2-3
Men''s Water Polo 第8场 2-3', '单循环决赛', 1777015800000, 1777018500000, TRUE, NULL, NULL),
('dd238dd6-ff72-5a8f-b197-e6a127794ecc', 'a1000000-0000-0000-0000-000000000002', '男子水球 第9场 6-4
Men''s Water Polo 第9场 6-4', '单循环决赛', 1777020300000, 1777023000000, TRUE, NULL, NULL),
('8c95b2d0-1752-5d23-a06b-075cc3abd520', 'a1000000-0000-0000-0000-000000000002', '女子水球 第7场 1-3
Women''s Water Polo 第7场 1-3', '单循环决赛', 1777080600000, 1777083300000, TRUE, NULL, NULL),
('c02f02af-b9cb-5b58-91a0-29541044708d', 'a1000000-0000-0000-0000-000000000002', '女子水球 第8场 5-2
Women''s Water Polo 第8场 5-2', '单循环决赛', 1777083300000, 1777086000000, TRUE, NULL, NULL),
('e498e998-e4e8-57c4-a658-b10696556fc5', 'a1000000-0000-0000-0000-000000000002', '男子水球 第10场 4-2
Men''s Water Polo 第10场 4-2', '单循环决赛', 1777099500000, 1777102200000, TRUE, NULL, NULL),
('1dd9691e-875f-5197-8f32-41cc28970cf1', 'a1000000-0000-0000-0000-000000000002', '男子水球 第11场 5-6
Men''s Water Polo 第11场 5-6', '单循环决赛', 1777102200000, 1777104900000, TRUE, NULL, NULL),
('a07e4719-2888-54fc-8ff3-7f2a70817cf3', 'a1000000-0000-0000-0000-000000000002', '男子水球 第12场 1-3
Men''s Water Polo 第12场 1-3', '单循环决赛', 1777106700000, 1777109400000, TRUE, NULL, NULL),
('10edf254-93b7-5835-aa18-d910cc66d930', 'a1000000-0000-0000-0000-000000000002', '女子水球 第9场 3-4
Women''s Water Polo 第9场 3-4', '单循环决赛', 1777167000000, 1777169700000, TRUE, NULL, NULL),
('8734fa33-33a9-5600-9277-7abc701b3006', 'a1000000-0000-0000-0000-000000000002', '女子水球 第10场 1-2
Women''s Water Polo 第10场 1-2', '单循环决赛', 1777169700000, 1777172400000, TRUE, NULL, NULL),
('1b22c8b7-e0c7-5309-80d4-7cf3df4b8662', 'a1000000-0000-0000-0000-000000000002', '颁奖仪式
Victory Ceremony', '颁奖仪式', 1777194000000, 1777195800000, FALSE, NULL, NULL),
('3db3adeb-392c-5c76-a3cd-614d347c18df', 'a1000000-0000-0000-0000-000000000002', '男子水球 第13场 5-6
Men''s Water Polo 第13场 5-6', '单循环决赛', 1777185900000, 1777188600000, TRUE, NULL, NULL),
('250c6909-7f13-5861-82dc-99df901a3a15', 'a1000000-0000-0000-0000-000000000002', '男子水球 第14场 3-4
Men''s Water Polo 第14场 3-4', '单循环决赛', 1777188600000, 1777191300000, TRUE, NULL, NULL),
('850bf85c-0e30-5319-b231-3f32444e41dc', 'a1000000-0000-0000-0000-000000000002', '男子水球 第15场 1-2
Men''s Water Polo 第15场 1-2', '单循环决赛', 1777193100000, 1777195800000, TRUE, NULL, NULL),
('90619c28-0f9b-51fd-a81b-bd59f12cd16d', 'a1000000-0000-0000-0000-000000000002', '颁奖仪式
Victory Ceremony', '颁奖仪式', 1777194000000, 1777195800000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 三人篮球 (74 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('4895dd8e-f8ce-54b3-80e5-49e762063bc3', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组 A1 vs A2
Women''s 3x3 Basketball Group A A1 vs A2', '小组赛', 1777086000000, 1777088700000, FALSE, NULL, NULL),
('75195db3-7080-5ec0-aa5a-4f49c63f3061', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组 A3 vs A4
Women''s 3x3 Basketball Group A A3 vs A4', '小组赛', 1777087500000, 1777090200000, FALSE, NULL, NULL),
('205588ec-e838-5424-b586-cd0f44b1f65e', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组 A1 vs A2
Men''s 3x3 Basketball Group A A1 vs A2', '小组赛', 1777089000000, 1777091700000, FALSE, NULL, NULL),
('14f039aa-8f6e-5a49-a93c-203f6a02b168', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组 A3 vs A4
Men''s 3x3 Basketball Group A A3 vs A4', '小组赛', 1777090500000, 1777093200000, FALSE, NULL, NULL),
('46226bc2-d549-5183-bdd5-62df99e4df2c', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组 A1 vs A3
Women''s 3x3 Basketball Group A A1 vs A3', '小组赛', 1777092000000, 1777094700000, FALSE, NULL, NULL),
('4c646d63-7086-550f-9a2e-efb23f5a77bd', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组 A2 vs A4
Women''s 3x3 Basketball Group A A2 vs A4', '小组赛', 1777093500000, 1777096200000, FALSE, NULL, NULL),
('9c4aa2c6-b1b5-59df-8ba4-a62f01c2232e', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组 A1 vs A3
Men''s 3x3 Basketball Group A A1 vs A3', '小组赛', 1777095000000, 1777097700000, FALSE, NULL, NULL),
('b4512aef-b766-58a5-913d-72128e160aaa', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组 A2 vs A4
Men''s 3x3 Basketball Group A A2 vs A4', '小组赛', 1777096500000, 1777099200000, FALSE, NULL, NULL),
('a10e70f9-19f5-505d-8e77-2d0e2dcfe9f4', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组 C1 vs C2
Women''s 3x3 Basketball Group C C1 vs C2', '小组赛', 1777105200000, 1777107900000, FALSE, NULL, NULL),
('18eae31e-f264-5be4-b4cb-85cafdd64b54', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组 C3 vs C4
Women''s 3x3 Basketball Group C C3 vs C4', '小组赛', 1777106700000, 1777109400000, FALSE, NULL, NULL),
('08429f8b-21c0-52f5-93bb-6a8f5601901e', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组 C1 vs C2
Men''s 3x3 Basketball Group C C1 vs C2', '小组赛', 1777108200000, 1777110900000, FALSE, NULL, NULL),
('a3e3b4b1-7e83-56f8-ae2a-3a8dcd4b8308', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组 C3 vs C4
Men''s 3x3 Basketball Group C C3 vs C4', '小组赛', 1777109700000, 1777112400000, FALSE, NULL, NULL),
('cae67b92-3dc2-50d6-8b3d-62034aeab3ae', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组 C1 vs C3
Women''s 3x3 Basketball Group C C1 vs C3', '小组赛', 1777111200000, 1777113900000, FALSE, NULL, NULL),
('6d60fee3-9859-5e57-8071-4dc323515050', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组 C2 vs C4
Women''s 3x3 Basketball Group C C2 vs C4', '小组赛', 1777112700000, 1777115400000, FALSE, NULL, NULL),
('fca31e85-23f7-5930-acc0-429086883134', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组 C1 vs C3
Men''s 3x3 Basketball Group C C1 vs C3', '小组赛', 1777114200000, 1777116900000, FALSE, NULL, NULL),
('20ceb5e5-0134-51f1-bd0e-78621b406309', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组 C2 vs C4
Men''s 3x3 Basketball Group C C2 vs C4', '小组赛', 1777115700000, 1777118400000, FALSE, NULL, NULL),
('13e135fa-7a0a-5245-9f8e-fe568126420b', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组 B1 vs B2
Women''s 3x3 Basketball Group B B1 vs B2', '小组赛', 1777172400000, 1777175100000, FALSE, NULL, NULL),
('8079bcdd-4cb5-569c-9dc3-cede677152fa', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组 B3 vs B4
Women''s 3x3 Basketball Group B B3 vs B4', '小组赛', 1777173900000, 1777176600000, FALSE, NULL, NULL),
('d6b35345-9741-566a-ba9c-1c16a250ada8', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组 B1 vs B2
Men''s 3x3 Basketball Group B B1 vs B2', '小组赛', 1777175400000, 1777178100000, FALSE, NULL, NULL),
('20165d70-a6c0-593f-bbc4-bcd07d8988be', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组 B3 vs B4
Men''s 3x3 Basketball Group B B3 vs B4', '小组赛', 1777176900000, 1777179600000, FALSE, NULL, NULL),
('c76508a6-ba98-5369-85d1-3204c1712f9b', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组 B1 vs B3
Women''s 3x3 Basketball Group B B1 vs B3', '小组赛', 1777178400000, 1777181100000, FALSE, NULL, NULL),
('f339c930-59fb-5a3e-8ff2-43c097021e7a', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组 B2 vs B4
Women''s 3x3 Basketball Group B B2 vs B4', '小组赛', 1777179900000, 1777182600000, FALSE, NULL, NULL),
('5dc8474c-8836-5689-83e6-86b100839572', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组 B1 vs B3
Men''s 3x3 Basketball Group B B1 vs B3', '小组赛', 1777181400000, 1777184100000, FALSE, NULL, NULL),
('bfec50f5-64b5-552b-ac4f-a7f372fc728e', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组 B2 vs B4
Men''s 3x3 Basketball Group B B2 vs B4', '小组赛', 1777182900000, 1777185600000, FALSE, NULL, NULL),
('ea556c50-b49b-5130-a409-d83275972e42', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组 D1 vs D2
Women''s 3x3 Basketball Group D D1 vs D2', '小组赛', 1777191600000, 1777194300000, FALSE, NULL, NULL),
('47114fed-44a1-5c2a-8c8d-d6af3c607312', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组 D3 vs D4
Women''s 3x3 Basketball Group D D3 vs D4', '小组赛', 1777193100000, 1777195800000, FALSE, NULL, NULL),
('e5024850-87c2-5632-b29b-3142f5bbf4ec', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组 D1 vs D2
Men''s 3x3 Basketball Group D D1 vs D2', '小组赛', 1777194600000, 1777197300000, FALSE, NULL, NULL),
('0c47d7bb-cc03-5751-a2a2-a37369a62b11', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组 D3 vs D4
Men''s 3x3 Basketball Group D D3 vs D4', '小组赛', 1777196100000, 1777198800000, FALSE, NULL, NULL),
('7ab0caa8-140d-5964-8b1a-b30247e6501e', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组 D1 vs D3
Women''s 3x3 Basketball Group D D1 vs D3', '小组赛', 1777197600000, 1777200300000, FALSE, NULL, NULL),
('5f862f25-d3fe-53f5-9f2c-93fdf343ca7b', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组 D2 vs D4
Women''s 3x3 Basketball Group D D2 vs D4', '小组赛', 1777199100000, 1777201800000, FALSE, NULL, NULL),
('8cb0e8d2-94cc-5962-9e33-b4ad251cf00a', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组 D1 vs D3
Men''s 3x3 Basketball Group D D1 vs D3', '小组赛', 1777200600000, 1777203300000, FALSE, NULL, NULL),
('32707517-1a1d-5c9b-afde-974a7ceddb57', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组 D2 vs D4
Men''s 3x3 Basketball Group D D2 vs D4', '小组赛', 1777202100000, 1777204800000, FALSE, NULL, NULL),
('dd602198-cbab-52dd-aefa-6fc6cf6c0281', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组 A1 vs A4
Women''s 3x3 Basketball Group A A1 vs A4', '小组赛', 1777258800000, 1777261500000, FALSE, NULL, NULL),
('2de984cd-f079-5abd-8db4-431c958adbd6', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组 A2 vs A3
Women''s 3x3 Basketball Group A A2 vs A3', '小组赛', 1777260300000, 1777263000000, FALSE, NULL, NULL),
('6867d5de-9632-542b-a70f-5fc5b74a7b09', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组 A1 vs A4
Men''s 3x3 Basketball Group A A1 vs A4', '小组赛', 1777261800000, 1777264500000, FALSE, NULL, NULL),
('38cd2c90-be25-54c7-9fcb-a0b87befc8f6', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组 A2 vs A3
Men''s 3x3 Basketball Group A A2 vs A3', '小组赛', 1777263300000, 1777266000000, FALSE, NULL, NULL),
('ae708607-fa5c-5062-9926-b7348f7cfd32', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组 B1 vs B4
Women''s 3x3 Basketball Group B B1 vs B4', '小组赛', 1777264800000, 1777267500000, FALSE, NULL, NULL),
('d1e950af-6275-52f7-8882-146a34c38063', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组 B2 vs B3
Women''s 3x3 Basketball Group B B2 vs B3', '小组赛', 1777266300000, 1777269000000, FALSE, NULL, NULL),
('167baf44-1d39-55f9-a948-74d4f5fc5aca', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组 B1 vs B4
Men''s 3x3 Basketball Group B B1 vs B4', '小组赛', 1777267800000, 1777270500000, FALSE, NULL, NULL),
('b0f0c331-aefc-5241-91e4-7c8d77517b10', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组 B2 vs B3
Men''s 3x3 Basketball Group B B2 vs B3', '小组赛', 1777269300000, 1777272000000, FALSE, NULL, NULL),
('e938ac45-d978-53a4-9c7f-9e16082a79f7', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组 C1 vs C4
Women''s 3x3 Basketball Group C C1 vs C4', '小组赛', 1777278000000, 1777280700000, FALSE, NULL, NULL),
('c91f2ff5-c47d-52e6-a33f-24f22fad3339', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组 C2 vs C3
Women''s 3x3 Basketball Group C C2 vs C3', '小组赛', 1777279500000, 1777282200000, FALSE, NULL, NULL),
('639d9809-7c4f-56af-9bcb-4aa23819fb3c', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组 C1 vs C4
Men''s 3x3 Basketball Group C C1 vs C4', '小组赛', 1777281000000, 1777283700000, FALSE, NULL, NULL),
('a08fc4f1-2297-5bb4-a40a-ce75619574e9', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组 C2 vs C3
Men''s 3x3 Basketball Group C C2 vs C3', '小组赛', 1777282500000, 1777285200000, FALSE, NULL, NULL),
('c5a8ff26-1954-5abb-9db9-533784ccad2d', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组 D1 vs D4
Women''s 3x3 Basketball Group D D1 vs D4', '小组赛', 1777284000000, 1777286700000, FALSE, NULL, NULL),
('079e1d43-676e-5370-85ee-e6d9fd2c5858', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组 D2 vs D3
Women''s 3x3 Basketball Group D D2 vs D3', '小组赛', 1777285500000, 1777288200000, FALSE, NULL, NULL),
('57a6eb9f-eb36-501c-a617-fbd4793e0c96', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组 D1 vs D4
Men''s 3x3 Basketball Group D D1 vs D4', '小组赛', 1777287000000, 1777289700000, FALSE, NULL, NULL),
('dc535265-0f3f-5312-ada5-1527596e289f', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组 D2 vs D3
Men''s 3x3 Basketball Group D D2 vs D3', '小组赛', 1777288500000, 1777291200000, FALSE, NULL, NULL),
('347845c9-d9ee-5b86-826d-21db0cb33796', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组第二 vs B组第三
2nd of Pool C vs 3rd of Pool B
Women''s 3x3 Basketball C组第二 vs B组第三
2nd of Pool C vs 3rd of Pool B', '四分之一晋级赛', 1777345200000, 1777347900000, FALSE, NULL, NULL),
('63dc0c17-ea66-5ca1-8a89-82aea071d417', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组第二 vs C组第三
2nd of Pool B vs 3rd of Pool C
Women''s 3x3 Basketball B组第二 vs C组第三
2nd of Pool B vs 3rd of Pool C', '四分之一晋级赛', 1777346700000, 1777349400000, FALSE, NULL, NULL),
('62bbf395-234c-5dec-a5d5-3d210dddd78d', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组第二 vs B组第三
2nd of Pool C vs 3rd of Pool B
Men''s 3x3 Basketball C组第二 vs B组第三
2nd of Pool C vs 3rd of Pool B', '四分之一晋级赛', 1777348200000, 1777350900000, FALSE, NULL, NULL),
('5a512afa-6919-5f3e-ba75-a72528c7a1a0', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组第二 vs C组第三
2nd of Pool B vs 3rd of Pool C
Men''s 3x3 Basketball B组第二 vs C组第三
2nd of Pool B vs 3rd of Pool C', '四分之一晋级赛', 1777349700000, 1777352400000, FALSE, NULL, NULL),
('acc16dbd-c709-5b49-9645-0985f0af91f9', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组第二 vs D组第三
2nd of Pool A vs 3rd of Pool D
Women''s 3x3 Basketball A组第二 vs D组第三
2nd of Pool A vs 3rd of Pool D', '四分之一晋级赛', 1777351200000, 1777353900000, FALSE, NULL, NULL),
('bd5b7a4f-4d7d-55ec-8339-b960abbd82f9', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组第二 vs A组第三
2nd of Pool D vs 3rd of Pool A
Women''s 3x3 Basketball D组第二 vs A组第三
2nd of Pool D vs 3rd of Pool A', '四分之一晋级赛', 1777352700000, 1777355400000, FALSE, NULL, NULL),
('bcb39147-de73-542b-89e8-40ce98c0410c', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组第二 vs D组第三
2nd of Pool A vs 3rd of Pool D
Men''s 3x3 Basketball A组第二 vs D组第三
2nd of Pool A vs 3rd of Pool D', '四分之一晋级赛', 1777354200000, 1777356900000, FALSE, NULL, NULL),
('969b54b1-040a-5ac2-b56b-8aa09a1891bb', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组第二 vs A组第三
2nd of Pool D vs 3rd of Pool A
Men''s 3x3 Basketball D组第二 vs A组第三
2nd of Pool D vs 3rd of Pool A', '四分之一晋级赛', 1777355700000, 1777358400000, FALSE, NULL, NULL),
('f43f769a-77de-586f-b9a7-96e5ebc4b552', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 A组第一 vs 49胜者
1st of Pool A vs 49 Winner
Women''s 3x3 Basketball A组第一 vs 49胜者
1st of Pool A vs 49 Winner', '四分之一决赛', 1777364400000, 1777367100000, TRUE, NULL, NULL),
('5776631a-40ab-5063-ba80-924846aeb58c', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 D组第一 vs 50胜者
1st of Pool D vs 50 Winner
Women''s 3x3 Basketball D组第一 vs 50胜者
1st of Pool D vs 50 Winner', '四分之一决赛', 1777365900000, 1777368600000, TRUE, NULL, NULL),
('0bb0d638-ef3b-5c1e-86d8-65ee5ff05824', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 A组第一 vs 51胜者
1st of Pool A vs 51 Winner
Men''s 3x3 Basketball A组第一 vs 51胜者
1st of Pool A vs 51 Winner', '四分之一决赛', 1777367400000, 1777370100000, TRUE, NULL, NULL),
('26e944dd-0494-5395-86c7-3968360ba631', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 D组第一 vs 52胜者
1st of Pool D vs 52 Winner
Men''s 3x3 Basketball D组第一 vs 52胜者
1st of Pool D vs 52 Winner', '四分之一决赛', 1777368900000, 1777371600000, TRUE, NULL, NULL),
('b8b54ea9-edc8-5fba-b31d-edb921b24b8d', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 C组第一 vs 53胜者
1st of Pool C vs 53 Winner
Women''s 3x3 Basketball C组第一 vs 53胜者
1st of Pool C vs 53 Winner', '四分之一决赛', 1777370400000, 1777373100000, TRUE, NULL, NULL),
('ae97baf7-b155-50be-bdfc-6a4fded2b63c', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 B组第一 vs 54胜者
1st of Pool B vs 54 Winner
Women''s 3x3 Basketball B组第一 vs 54胜者
1st of Pool B vs 54 Winner', '四分之一决赛', 1777371900000, 1777374600000, TRUE, NULL, NULL),
('be9a7d24-6d2a-5733-b827-c2eef45b4a84', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 C组第一 vs 55胜者
1st of Pool C vs 55 Winner
Men''s 3x3 Basketball C组第一 vs 55胜者
1st of Pool C vs 55 Winner', '四分之一决赛', 1777373400000, 1777376100000, TRUE, NULL, NULL),
('aa6b7d86-8846-5a84-8f9a-94e91f6be988', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 B组第一 vs 56胜者
1st of Pool B vs 56 Winner
Men''s 3x3 Basketball B组第一 vs 56胜者
1st of Pool B vs 56 Winner', '四分之一决赛', 1777374900000, 1777377600000, TRUE, NULL, NULL),
('35cdb217-a3bf-5b72-9919-48c133c436de', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 57胜者 vs 58胜者
57 Winner vs 58 Winner
Women''s 3x3 Basketball 57胜者 vs 58胜者
57 Winner vs 58 Winner', '半决赛', 1777442400000, 1777445100000, TRUE, NULL, NULL),
('ca629b25-81f3-5fd9-ac84-3e671bf5a402', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 61胜者 vs 62胜者
61 Winner vs 62 Winner
Women''s 3x3 Basketball 61胜者 vs 62胜者
61 Winner vs 62 Winner', '半决赛', 1777443900000, 1777446600000, TRUE, NULL, NULL),
('a1813c21-0b83-5787-b3e4-869228a36567', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 59胜者 vs 60胜者
59 Winner vs 60 Winner
Men''s 3x3 Basketball 59胜者 vs 60胜者
59 Winner vs 60 Winner', '半决赛', 1777445400000, 1777448100000, TRUE, NULL, NULL),
('d5b65ce4-d0d7-5aa9-9910-8edcf3cfadba', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 63胜者 vs 64胜者
63 Winner vs 64 Winner
Men''s 3x3 Basketball 63胜者 vs 64胜者
63 Winner vs 64 Winner', '半决赛', 1777446900000, 1777449600000, TRUE, NULL, NULL),
('12b2c623-9672-5c0c-8cbd-3e114c5fbf21', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 65负者 vs 67负者
65 Loser vs 67 Loser
Women''s 3x3 Basketball 65负者 vs 67负者
65 Loser vs 67 Loser', '铜牌赛', 1777456800000, 1777459500000, TRUE, NULL, NULL),
('4fc49091-b2b7-529b-b21a-53151a7b85b7', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 66负者 vs 68负者
66 Loser vs 68 Loser
Men''s 3x3 Basketball 66负者 vs 68负者
66 Loser vs 68 Loser', '铜牌赛', 1777458600000, 1777461300000, TRUE, NULL, NULL),
('3fb9e1d6-6825-57da-a1c8-ac19427a9a55', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球 65胜者 vs 67胜者
65 Winner vs 67 Winner
Women''s 3x3 Basketball 65胜者 vs 67胜者
65 Winner vs 67 Winner', '金牌赛', 1777460400000, 1777463100000, TRUE, NULL, NULL),
('27d01dcd-2e3f-51da-ba83-f506af6594b6', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球 66胜者 vs 68胜者
66 Winner vs 68 Winner
Men''s 3x3 Basketball 66胜者 vs 68胜者
66 Winner vs 68 Winner', '金牌赛', 1777462200000, 1777464900000, TRUE, NULL, NULL),
('d69c5052-93a2-5107-877c-e526a2e69944', 'a1000000-0000-0000-0000-000000000003', '女子三人篮球颁奖仪式
Women''s 3x3 Basketball Victory Ceremony', '颁奖仪式', 1777464000000, 1777466700000, FALSE, NULL, NULL),
('8a2164f6-1245-50ca-b020-76d73ea1719f', 'a1000000-0000-0000-0000-000000000003', '男子三人篮球颁奖仪式
Men''s 3x3 Basketball Victory Ceremony', '颁奖仪式', 1777464600000, 1777467300000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 沙滩田径 (35 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('df21e8c2-a838-523c-8978-fde9919dc2d6', 'a1000000-0000-0000-0000-000000000004', '女子60米/Women''s 60m', '预赛', 1776906000000, 1776907800000, FALSE, NULL, NULL),
('152115e9-0b95-5bd7-b5bc-6569f11a686e', 'a1000000-0000-0000-0000-000000000004', '男子跳高/Men''s High Jump', '决赛', 1776906300000, 1776911700000, TRUE, NULL, NULL),
('311871e6-4d67-522b-9d6a-a2b86c519cff', 'a1000000-0000-0000-0000-000000000004', '女子跳远/Women''s Long Jump', '决赛', 1776907800000, 1776911400000, TRUE, NULL, NULL),
('44bc2b13-74fd-59a4-8330-730b9c5c5977', 'a1000000-0000-0000-0000-000000000004', '男子60米/Men''s 60m', '预赛', 1776909000000, 1776910800000, FALSE, NULL, NULL),
('e2357cee-2e9c-5e12-a57a-8404c8a792cd', 'a1000000-0000-0000-0000-000000000004', '颁奖仪式
Victory ceremony', '', 1776911700000, 1776912900000, FALSE, NULL, NULL),
('596cce01-0deb-58e9-b2b3-5a3189879105', 'a1000000-0000-0000-0000-000000000004', '女子60米/Women''s 60m', '复赛', 1776992400000, 1776993300000, FALSE, NULL, NULL),
('0af5accb-ce16-5a13-a61e-6be16f61cd7e', 'a1000000-0000-0000-0000-000000000004', '女子跳高/Women''s High Jump', '决赛', 1776993600000, 1776999000000, TRUE, NULL, NULL),
('c0dce69c-9921-5c01-9578-259953b86d2a', 'a1000000-0000-0000-0000-000000000004', '男子60米/Men''s 60m', '复赛', 1776993900000, 1776994800000, FALSE, NULL, NULL),
('f1824db5-5fb4-52f9-82ba-bdc017ae41d3', 'a1000000-0000-0000-0000-000000000004', '男子跳远/Men''s Long Jump', '决赛', 1776994800000, 1776998400000, TRUE, NULL, NULL),
('da223b3e-df41-5803-863a-508677d8ede2', 'a1000000-0000-0000-0000-000000000004', '颁奖仪式
Victory ceremony', '', 1776998700000, 1776999900000, FALSE, NULL, NULL),
('cadfa092-82aa-5e35-8297-796fe7bcf637', 'a1000000-0000-0000-0000-000000000004', '男子铅球/Men''s Shot Put', '决赛', 1777080600000, 1777083600000, TRUE, NULL, NULL),
('587cb817-f39f-59eb-a9d1-ccbe4fa49139', 'a1000000-0000-0000-0000-000000000004', '女子4*60米/Women''s 4*60 Relay', '预赛', 1777081200000, 1777082400000, FALSE, NULL, NULL),
('f4fe4693-2510-52a0-8424-9b223d0675ea', 'a1000000-0000-0000-0000-000000000004', '男子4*60米/Men''s 4*60 Relay', '预赛', 1777082700000, 1777083900000, FALSE, NULL, NULL),
('4b1f48b9-6958-5d54-bacb-2887e9148004', 'a1000000-0000-0000-0000-000000000004', '颁奖仪式
Victory ceremony', '', 1777084200000, 1777084800000, FALSE, NULL, NULL),
('82bf0879-59d6-5ecb-b80c-214fb1073855', 'a1000000-0000-0000-0000-000000000004', '女子铅球/Women''s Shot Put', '决赛', 1777167000000, 1777169700000, TRUE, NULL, NULL),
('c9752879-03e6-5c4a-b351-288da7beed0b', 'a1000000-0000-0000-0000-000000000004', '女子4*60米/Women''s 4*60 Relay', '决赛', 1777168200000, 1777168800000, TRUE, NULL, NULL),
('49d02b08-504a-5f9f-85b7-ddc232d0b458', 'a1000000-0000-0000-0000-000000000004', '男子4*60米/Men''s 4*60 Relay', '决赛', 1777169400000, 1777170000000, TRUE, NULL, NULL),
('cb065a96-e778-5c4f-bc0d-37066aa1eaa2', 'a1000000-0000-0000-0000-000000000004', '颁奖仪式
Victory ceremony', '', 1777170300000, 1777171200000, FALSE, NULL, NULL),
('73c3f63e-6971-53fc-a33c-68ddbf8a3e4a', 'a1000000-0000-0000-0000-000000000004', '女子60米/Women''s 60m', '预赛', 1776992400000, 1776994080000, FALSE, NULL, NULL),
('13837a28-29c5-5c66-b947-3db68d7aa10a', 'a1000000-0000-0000-0000-000000000004', '男子跳高/Men''s High Jump', '决赛', 1776992700000, 1776998100000, TRUE, NULL, NULL),
('3a3e6cd2-883a-5856-a339-ea00cd262c6c', 'a1000000-0000-0000-0000-000000000004', '男子60米/Men''s 60m', '预赛', 1776994200000, 1776995880000, FALSE, NULL, NULL),
('6c748355-cddf-572b-833d-7670b9eaa4f2', 'a1000000-0000-0000-0000-000000000004', '女子跳远/Women''s Long Jump', '决赛', 1776995400000, 1776998100000, TRUE, NULL, NULL),
('a7145575-d87c-5261-9751-24e19b4fbe96', 'a1000000-0000-0000-0000-000000000004', '女子60米/Women''s 60m', '决赛', 1776998100000, 1776998460000, TRUE, NULL, NULL),
('c07d710f-b2cf-574e-82f2-1f51ffd23485', 'a1000000-0000-0000-0000-000000000004', '男子60米/Men''s 60m', '决赛', 1776998700000, 1776999120000, TRUE, NULL, NULL),
('8025cbc1-4497-52e6-a361-fb0e9207fb79', 'a1000000-0000-0000-0000-000000000004', '颁奖仪式
Victory ceremony', '', 1776999600000, 1777000800000, FALSE, NULL, NULL),
('91373322-737b-54ab-b6d4-9df8bf3511b8', 'a1000000-0000-0000-0000-000000000004', '男子跳远/Men''s Long Jump', '决赛', 1777078800000, 1777082400000, TRUE, NULL, NULL),
('fd4c8a6f-509c-53bc-aa62-4cd9a0bf1c10', 'a1000000-0000-0000-0000-000000000004', '女子4*60米/Women''s 4*60 Relay', '预赛', 1777079400000, 1777080600000, FALSE, NULL, NULL),
('111efe78-9bee-59b8-a19c-cefc9217ad24', 'a1000000-0000-0000-0000-000000000004', '女子铅球/Women''s Shot Put', '决赛', 1777080600000, 1777082400000, TRUE, NULL, NULL),
('080977b5-0f4d-570d-bb85-238f1f7b9480', 'a1000000-0000-0000-0000-000000000004', '男子4*60米/Men''s 4*60 Relay', '预赛', 1777082400000, 1777083600000, FALSE, NULL, NULL),
('58f5e136-dbcf-5856-b5aa-b7f54af1967a', 'a1000000-0000-0000-0000-000000000004', '颁奖仪式
Victory ceremony', '', 1777084200000, 1777085400000, FALSE, NULL, NULL),
('5078d4c2-93d4-5bae-a32e-65c92df163d9', 'a1000000-0000-0000-0000-000000000004', '女子跳高/Women''s High Jump', '决赛', 1777165200000, 1777168200000, TRUE, NULL, NULL),
('fd79c554-dbbd-5802-b512-f99054ecba94', 'a1000000-0000-0000-0000-000000000004', '女子4*60米/Women''s 4*60 Relay', '决赛', 1777166400000, 1777167600000, TRUE, NULL, NULL),
('cc246a3e-8d73-586c-9551-e5a94f035b4e', 'a1000000-0000-0000-0000-000000000004', '男子铅球/Men''s Shot Put', '决赛', 1777168200000, 1777171500000, TRUE, NULL, NULL),
('a34671d2-21be-5f1b-9ae8-3a7a9acc5615', 'a1000000-0000-0000-0000-000000000004', '男子4*60米/Men''s 4*60 Relay', '决赛', 1777169400000, 1777170600000, TRUE, NULL, NULL),
('ba6f0caf-bcff-5b37-99b9-c452b490c974', 'a1000000-0000-0000-0000-000000000004', '颁奖仪式
Victory ceremony', '', 1777171500000, 1777172700000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 龙舟 (10 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('0f98fedd-d0db-591d-96ff-ecee8a89f7f7', 'a1000000-0000-0000-0000-000000000005', 'Openning Ceremony (to be confirmed)
开赛仪式（待确认）', '', 1776992400000, 1776995100000, FALSE, NULL, NULL),
('cfad5386-4084-5c01-a0ec-cc001d12b283', 'a1000000-0000-0000-0000-000000000005', 'small boat (12) Men''s 100m
男子12人制100米', '决赛', 1776993300000, 1777003200000, TRUE, NULL, NULL),
('871b5ce4-186a-5310-8c48-c3ad6b59944b', 'a1000000-0000-0000-0000-000000000005', 'small boat (12) Women''s 100m
女子12人制100米', '决赛', 1776993300000, 1777003200000, TRUE, NULL, NULL),
('94effbac-d307-5d14-b085-7ccad5e37eb2', 'a1000000-0000-0000-0000-000000000005', 'Victory Ceremony
颁奖仪式', '', 1776993300000, 1777003200000, FALSE, NULL, NULL),
('1053feeb-0120-52e3-b20b-76823f13f660', 'a1000000-0000-0000-0000-000000000005', 'small boat (12) Men''s 200m
男子12人制200米', '决赛', 1777078800000, 1777089600000, TRUE, NULL, NULL),
('371556a1-cad9-5835-a84f-6ca135e40b76', 'a1000000-0000-0000-0000-000000000005', 'small boat (12) Women''s 200m
男子12人制200米', '决赛', 1777078800000, 1777089600000, TRUE, NULL, NULL),
('dabe841d-0053-55f9-adad-bb1ac902d0c3', 'a1000000-0000-0000-0000-000000000005', 'Victory Ceremony
颁奖仪式', '', 1777078800000, 1777089600000, FALSE, NULL, NULL),
('e85b7404-72b0-5f9d-a07a-88b1098af301', 'a1000000-0000-0000-0000-000000000005', 'small boat (12) Men''s 400m
男子12人制400米', '决赛', 1777165200000, 1777176000000, TRUE, NULL, NULL),
('072c6b1a-6a3e-5e82-be72-859b02c9acfe', 'a1000000-0000-0000-0000-000000000005', 'small boat (12) Women''s 400m
男子12人制400米', '决赛', 1777165200000, 1777176000000, TRUE, NULL, NULL),
('0939764e-004b-5c86-86a2-c3b3f0957f98', 'a1000000-0000-0000-0000-000000000005', 'Victory Ceremony
颁奖仪式', '', 1777165200000, 1777176000000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 沙滩足球 (10 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('d00f1f6e-d709-5152-9cdb-df25e5fa3af2', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第1场 A2 vs A3
Men''s Beach Football 第1场 A2 vs A3', '小组赛', 1776938400000, 1776941100000, FALSE, NULL, NULL),
('d601a4c3-bcdc-5a85-8f32-99bac9271cfb', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第2场 B2 vs B3
Men''s Beach Football 第2场 B2 vs B3', '小组赛', 1776945600000, 1776948300000, FALSE, NULL, NULL),
('6dba8317-2f5d-5b58-8e88-4eff89cb0b54', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第3场 A3 vs A1
Men''s Beach Football 第3场 A3 vs A1', '小组赛', 1777024800000, 1777027500000, FALSE, NULL, NULL),
('9147145e-73b2-55ad-82c9-1c8d14d08177', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第4场 B3 vs B1
Men''s Beach Football 第4场 B3 vs B1', '小组赛', 1777032000000, 1777034700000, FALSE, NULL, NULL),
('49f87841-0a91-55e9-a1c0-95529cdbe3b8', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第5场 A1 vs A2
Men''s Beach Football 第5场 A1 vs A2', '小组赛', 1777111200000, 1777113900000, FALSE, NULL, NULL),
('a792f000-6108-5aad-8018-b3eaca4cb356', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第6场 B1 vs B2
Men''s Beach Football 第6场 B1 vs B2', '小组赛', 1777118400000, 1777121100000, FALSE, NULL, NULL),
('31076b69-b5d1-51f8-81ca-3f50b54d5f5b', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第7场 1A vs 2B
Men''s Beach Football 第7场 1A vs 2B', '半决赛', 1777284000000, 1777286700000, TRUE, NULL, NULL),
('9e9153cc-747d-5d6a-9d6c-93104ec4aa4a', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第8场 1B vs 2A
Men''s Beach Football 第8场 1B vs 2A', '半决赛', 1777291200000, 1777293900000, TRUE, NULL, NULL),
('037084bc-1dee-5d43-9fea-9410c6511235', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第9场 Loser SF1 vs Loser SF2
Men''s Beach Football 第9场 Loser SF1 vs Loser SF2', '铜牌赛', 1777456800000, 1777459500000, TRUE, NULL, NULL),
('51254809-0b2f-5afe-92b6-5a773f7b421d', 'a1000000-0000-0000-0000-000000000006', '男子沙滩足球 第10场 Winner SF1 vs Winner SF2
Men''s Beach Football 第10场 Winner SF1 vs Winner SF2', '决赛', 1777464000000, 1777466700000, TRUE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 沙滩手球 (44 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('7bbbf039-0086-528c-af89-6db622979d98', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G1 A3-A4
Women''s Beach Handball Group A G1 A3-A4', '女子决赛轮', 1776736800000, 1776739200000, TRUE, NULL, NULL),
('46199768-8ffc-5e31-8bee-6545e5104298', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G2 A2-A5
Women''s Beach Handball Group A G2 A2-A5', '女子决赛轮', 1776740400000, 1776742800000, TRUE, NULL, NULL),
('016a018b-2302-5750-b940-d59adb2c9283', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G3 A1-A6
Women''s Beach Handball Group A G3 A1-A6', '女子决赛轮', 1776744000000, 1776746400000, TRUE, NULL, NULL),
('e782e1eb-a25f-5d7b-aa70-65391761d6ca', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G1 B3-B4
Men''s Beach Handball Group B G1 B3-B4', '预赛', 1776762000000, 1776764400000, FALSE, NULL, NULL),
('4c751f5e-a71f-548a-a970-7fec16d3cbb7', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G2 A4-A2
Men''s Beach Handball Group A G2 A4-A2', '预赛', 1776765600000, 1776768000000, FALSE, NULL, NULL),
('9410200b-e1fa-58e2-b899-0ffc9a7783a5', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G3 B2-B5
Men''s Beach Handball Group B G3 B2-B5', '预赛', 1776769200000, 1776771600000, FALSE, NULL, NULL),
('e884f8c2-1ddc-5ff1-ac35-ef3b53db56f8', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G4 A5-A1
Men''s Beach Handball Group A G4 A5-A1', '预赛', 1776772800000, 1776775200000, FALSE, NULL, NULL),
('fd0a6149-b4c0-5710-b8f4-09189ae48ce4', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G5 B1-B6
Men''s Beach Handball Group B G5 B1-B6', '预赛', 1776776400000, 1776778800000, FALSE, NULL, NULL),
('2283e973-6d9a-5cf3-95b2-fcf405646071', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G6 B2-B3
Men''s Beach Handball Group B G6 B2-B3', '预赛', 1776762000000, 1776764400000, FALSE, NULL, NULL),
('93a5a04a-4a01-5d07-941a-589e539ea64f', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G7 A3-A2
Men''s Beach Handball Group A G7 A3-A2', '预赛', 1776765600000, 1776768000000, FALSE, NULL, NULL),
('793bb303-fc5e-5597-b6fa-f715a8e1faee', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G8 B5-B1
Men''s Beach Handball Group B G8 B5-B1', '预赛', 1776769200000, 1776771600000, FALSE, NULL, NULL),
('c2450622-8b9e-5684-9f17-afdc7e94601b', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G9 A4-A1
Men''s Beach Handball Group A G9 A4-A1', '预赛', 1776772800000, 1776775200000, FALSE, NULL, NULL),
('bcefad07-e3aa-55d5-9bca-62d04d36a83d', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G10 B4-B6
Men''s Beach Handball Group B G10 B4-B6', '预赛', 1776776400000, 1776778800000, FALSE, NULL, NULL),
('304598f2-eb0c-550c-b188-efbc7f98a11b', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G4 A2-A3
Women''s Beach Handball Group A G4 A2-A3', '女子决赛轮', 1776823200000, 1776825600000, TRUE, NULL, NULL),
('3bbdba19-50c9-5b41-b8ca-466851591369', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G5 A5-A1
Women''s Beach Handball Group A G5 A5-A1', '女子决赛轮', 1776826800000, 1776829200000, TRUE, NULL, NULL),
('846b8a1f-1689-50f2-b79d-d690241b8cbe', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G6 A4-A6
Women''s Beach Handball Group A G6 A4-A6', '女子决赛轮', 1776830400000, 1776832800000, TRUE, NULL, NULL),
('f0484f1b-e86f-58cf-9123-9081df702d8c', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G11 B1-B4
Men''s Beach Handball Group B G11 B1-B4', '预赛', 1776848400000, 1776850800000, FALSE, NULL, NULL),
('4ad61e3f-8466-5e2b-a8e0-0032cb49fbe1', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G12 A3-A4
Men''s Beach Handball Group A G12 A3-A4', '预赛', 1776852000000, 1776854400000, FALSE, NULL, NULL),
('30d68097-f1e3-59b4-bef6-8e3216f54855', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G13 B6-B2
Men''s Beach Handball Group B G13 B6-B2', '预赛', 1776855600000, 1776858000000, FALSE, NULL, NULL),
('c503294a-0145-5c16-afe9-0960c2b34fa5', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G14 A2-A5
Men''s Beach Handball Group A G14 A2-A5', '预赛', 1776859200000, 1776861600000, FALSE, NULL, NULL),
('d92d3c40-a439-524b-8eb7-b70d283b4a19', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G15 B3-B5
Men''s Beach Handball Group B G15 B3-B5', '预赛', 1776862800000, 1776865200000, FALSE, NULL, NULL),
('937f87af-9412-5257-b833-ae9aa6eabb6d', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G16 B5-B6
Men''s Beach Handball Group B G16 B5-B6', '预赛', 1776848400000, 1776850800000, FALSE, NULL, NULL),
('873546fe-ae62-5e37-b368-b7d0833452c0', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G17 A5-A4
Men''s Beach Handball Group A G17 A5-A4', '预赛', 1776852000000, 1776854400000, FALSE, NULL, NULL),
('805ffd97-ed58-5e00-99f8-5da3afca1cdb', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G18 B3-B1
Men''s Beach Handball Group B G18 B3-B1', '预赛', 1776855600000, 1776858000000, FALSE, NULL, NULL),
('5591da38-beff-5943-b535-bd3b5a9144e4', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G19 A3-A1
Men''s Beach Handball Group A G19 A3-A1', '预赛', 1776859200000, 1776861600000, FALSE, NULL, NULL),
('906c36c7-6710-5708-afd4-556ec4b90e8d', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G20 B4-B2
Men''s Beach Handball Group B G20 B4-B2', '预赛', 1776862800000, 1776865200000, FALSE, NULL, NULL),
('d021fd45-58e0-5a4d-9af6-1a4ddcaa674a', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G7 A1-A4
Women''s Beach Handball Group A G7 A1-A4', '女子决赛轮', 1776909600000, 1776912000000, TRUE, NULL, NULL),
('a7c36465-87d6-5f15-9555-500d227c5983', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G8 A6-A2
Women''s Beach Handball Group A G8 A6-A2', '女子决赛轮', 1776913200000, 1776915600000, TRUE, NULL, NULL),
('52b3a522-9d1b-5ac7-a278-d2190180be72', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G9 A3-A5
Women''s Beach Handball Group A G9 A3-A5', '女子决赛轮', 1776916800000, 1776919200000, TRUE, NULL, NULL),
('fea006f4-7c4a-5f88-9947-9a687082e338', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G21 B6-B3
Men''s Beach Handball Group B G21 B6-B3', '预赛', 1776934800000, 1776937200000, FALSE, NULL, NULL),
('6f61886e-a3e7-5dbb-850a-68d0c2295593', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G22 A5-A3
Men''s Beach Handball Group A G22 A5-A3', '预赛', 1776938400000, 1776940800000, FALSE, NULL, NULL),
('2fd295af-a9bf-582e-a523-19ad891c9f67', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G23 B4-B5
Men''s Beach Handball Group B G23 B4-B5', '预赛', 1776942000000, 1776944400000, FALSE, NULL, NULL),
('91f4fd9d-e6de-54d9-b14d-35bdd768c603', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 A组 G24 A1-A2
Men''s Beach Handball Group A G24 A1-A2', '预赛', 1776945600000, 1776948000000, FALSE, NULL, NULL),
('88aa1b06-42f9-5cb0-a5b8-34170a38da16', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 B组 G25 B1-B2
Men''s Beach Handball Group B G25 B1-B2', '预赛', 1776949200000, 1776951600000, FALSE, NULL, NULL),
('15366459-3546-53dd-aee8-a864d4a68ab8', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G10 A5-A6
Women''s Beach Handball Group A G10 A5-A6', '女子决赛轮', 1776996000000, 1776998400000, TRUE, NULL, NULL),
('13d25eb0-5fbd-53f1-b196-2cce948be324', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G11 A3-A1
Women''s Beach Handball Group A G11 A3-A1', '女子决赛轮', 1776999600000, 1777002000000, TRUE, NULL, NULL),
('f1663030-19b6-5b1f-8f29-acc38341ae69', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G12 A4-A2
Women''s Beach Handball Group A G12 A4-A2', '女子决赛轮', 1777003200000, 1777005600000, TRUE, NULL, NULL),
('eb7bcdad-9137-5fb4-9f3b-450b23deefcb', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 /组 G26 First in Group A-Second in Group B
A组第1名-B组第2名
Men''s Beach Handball Group / G26 First in Group A-Second in Group B
A组第1名-B组第2名', '半决赛', 1777024800000, 1777027200000, TRUE, NULL, NULL),
('a50dfca3-a812-5fba-8a39-004ba3682c05', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 组 G27 First in Group B-Second in Group A
B组第1名-A组第2名
Men''s Beach Handball Group  G27 First in Group B-Second in Group A
B组第1名-A组第2名', '半决赛', 1777028400000, 1777030800000, TRUE, NULL, NULL),
('5510b9f1-b962-5bf2-ab16-094d416ab606', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G13 A6-A3
Women''s Beach Handball Group A G13 A6-A3', '女子决赛', 1777107600000, 1777110000000, TRUE, NULL, NULL),
('26b007ef-c0ed-5b70-8687-94b90ae6f697', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G14 A4-A5
Women''s Beach Handball Group A G14 A4-A5', '女子决赛', 1777111200000, 1777113600000, TRUE, NULL, NULL),
('7519decc-924b-5ea4-b087-b30f4ad22401', 'a1000000-0000-0000-0000-000000000007', '女子沙滩手球 A组 G15 A1-A2
Women''s Beach Handball Group A G15 A1-A2', '女子决赛', 1777114800000, 1777117200000, TRUE, NULL, NULL),
('413ad94a-2be2-509f-903d-55bc83151589', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 /组 G28 Loser M.26-Loser M.27
败者-M27败者
Men''s Beach Handball Group / G28 Loser M.26-Loser M.27
败者-M27败者', '铜牌赛', 1777118400000, 1777120800000, TRUE, NULL, NULL),
('0b1435a9-03e1-5536-97f8-79c498c3595f', 'a1000000-0000-0000-0000-000000000007', '男子沙滩手球 组 G29 Winner M.26-Winner M.27
M26胜者-M27胜者
Men''s Beach Handball Group  G29 Winner M.26-Winner M.27
M26胜者-M27胜者', '金牌赛', 1777122000000, 1777124400000, TRUE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 柔术 (12 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('c5cec492-10b8-57c6-865b-bb95759eb0c2', 'a1000000-0000-0000-0000-000000000008', '女子-52公斤Women’s-52KG', '预赛', 1776906000000, 1776922200000, TRUE, NULL, NULL),
('ccefdd94-280d-5c50-b637-4cd69f0186b7', 'a1000000-0000-0000-0000-000000000008', '女子-63公斤Women’s63-KG', '预赛', 1776906000000, 1776922200000, TRUE, NULL, NULL),
('534cc02c-d953-58bd-ae30-63aa1eb21292', 'a1000000-0000-0000-0000-000000000008', '男子-62公斤 Men’s62kg', '预赛', 1776906000000, 1776922200000, TRUE, NULL, NULL),
('4f8d6d64-f6ea-5d0d-b20e-5d2d4715fc84', 'a1000000-0000-0000-0000-000000000008', '女子-52公斤Women’s52KG', '决赛', 1776931200000, 1776938400000, TRUE, NULL, NULL),
('2478c5b0-27a2-5da1-ae00-5edd2597aaa6', 'a1000000-0000-0000-0000-000000000008', '女子-63公斤Women’s63-KG', '决赛', 1776931200000, 1776938400000, TRUE, NULL, NULL),
('3817846f-4b60-5400-95d3-e472f20855c0', 'a1000000-0000-0000-0000-000000000008', '男子-62公斤Men’s62KG', '决赛', 1776931200000, 1776938400000, TRUE, NULL, NULL),
('45bf749a-861e-5590-ba8b-f4f34dfed482', 'a1000000-0000-0000-0000-000000000008', '女子-57公斤Women’s57KG', '预赛', 1776992400000, 1777008600000, TRUE, NULL, NULL),
('01b76792-889a-594d-be2c-fb4fa9dfb497', 'a1000000-0000-0000-0000-000000000008', '男子-69公斤Men’s69KG', '预赛', 1776992400000, 1777008600000, TRUE, NULL, NULL),
('2a9ebc8a-5a61-5be5-86d9-c87bf4742cb3', 'a1000000-0000-0000-0000-000000000008', '男子-77公斤 Men’s-77KG', '预赛', 1776992400000, 1777008600000, TRUE, NULL, NULL),
('a23ead0d-7f78-5912-9851-70b5bd1dfef7', 'a1000000-0000-0000-0000-000000000008', '男子-69公斤Men’s69KG', '决赛', 1777017600000, 1777024800000, TRUE, NULL, NULL),
('27389e4c-41a9-5107-9d98-e3ad25f06dee', 'a1000000-0000-0000-0000-000000000008', '女子-57公斤Women’s57KG', '决赛', 1777017600000, 1777024800000, TRUE, NULL, NULL),
('af057b41-bc18-5889-8293-e0dae70849df', 'a1000000-0000-0000-0000-000000000008', '男子-77公斤 Men’s-77KG', '决赛', 1777017600000, 1777024800000, TRUE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 沙滩卡巴迪 (34 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('a9740237-d218-532e-a7a0-694f1a8d8a6a', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group A
A组 G1 A1 vs A2
Men''s Beach Kabaddi Group A
A组 G1 A1 vs A2', '小组赛', 1776906000000, 1776908100000, FALSE, NULL, NULL),
('e269a645-5d36-5225-847f-0c5180d57983', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group A
A组 G2 A3 vs A4
Men''s Beach Kabaddi Group A
A组 G2 A3 vs A4', '小组赛', 1776909600000, 1776911700000, FALSE, NULL, NULL),
('91fd4f77-189d-55ed-b92a-52bc7707ac04', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group B
B组 G3 B1 vs B2
Men''s Beach Kabaddi Group B
B组 G3 B1 vs B2', '小组赛', 1776913200000, 1776915300000, FALSE, NULL, NULL),
('d83c62d6-a244-5b45-aab8-92bb3af57943', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group B
B组 G4 B3 vs B4
Men''s Beach Kabaddi Group B
B组 G4 B3 vs B4', '小组赛', 1776931200000, 1776933300000, FALSE, NULL, NULL),
('7e9598af-4060-5811-b234-82c8c7470356', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group A
A组 G5 A1 vs A3
Men''s Beach Kabaddi Group A
A组 G5 A1 vs A3', '小组赛', 1776934800000, 1776936900000, FALSE, NULL, NULL),
('f95d45a5-b42d-5ab3-92f3-8200c3b229b8', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group A
A组 G6 A2 vs A4
Men''s Beach Kabaddi Group A
A组 G6 A2 vs A4', '小组赛', 1776938400000, 1776940500000, FALSE, NULL, NULL),
('b489e97c-8ec1-5ca8-8e87-1b9d02d08fac', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G7 W1 vs W2
Women''s Beach Kabaddi Single Round
单循环赛 G7 W1 vs W2', '小组赛', 1776992400000, 1776994500000, FALSE, NULL, NULL),
('c5a0ad37-266a-5a77-bd07-0163939d6bca', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G8 W3 vs W4
Women''s Beach Kabaddi Single Round
单循环赛 G8 W3 vs W4', '小组赛', 1776996000000, 1776998100000, FALSE, NULL, NULL),
('b11a68ae-579e-5070-a1ec-70edd19bf550', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G9 W5 vs W6
Women''s Beach Kabaddi Single Round
单循环赛 G9 W5 vs W6', '小组赛', 1776999600000, 1777001700000, FALSE, NULL, NULL),
('f729b0c6-43b0-5c12-81da-266f2a082b25', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G10 W1 vs W3
Women''s Beach Kabaddi Single Round
单循环赛 G10 W1 vs W3', '小组赛', 1777017600000, 1777019700000, FALSE, NULL, NULL),
('03894775-ba54-5682-a795-c14c6ce8c676', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G11 W2 vs W5
Women''s Beach Kabaddi Single Round
单循环赛 G11 W2 vs W5', '小组赛', 1777021200000, 1777023300000, FALSE, NULL, NULL),
('3dc5289d-ac3c-5306-ae04-d4dd1af9b653', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G12 W4 vs W6
Women''s Beach Kabaddi Single Round
单循环赛 G12 W4 vs W6', '小组赛', 1777024800000, 1777026900000, FALSE, NULL, NULL),
('3b68fd68-c2f7-54ad-9822-32e0faa1597a', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group B
B组 G13 B1 vs B3
Men''s Beach Kabaddi Group B
B组 G13 B1 vs B3', '小组赛', 1777078800000, 1777080900000, FALSE, NULL, NULL),
('0a74ff9f-9389-589a-b4a5-5c7049826a55', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group B
B组 G14 B2 vs B4
Men''s Beach Kabaddi Group B
B组 G14 B2 vs B4', '小组赛', 1777082400000, 1777084500000, FALSE, NULL, NULL),
('5b293abc-fb2d-54d4-9ce3-6852384bc464', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group A
A组 G15 A1 vs A4
Men''s Beach Kabaddi Group A
A组 G15 A1 vs A4', '小组赛', 1777086000000, 1777088100000, FALSE, NULL, NULL),
('6505d326-545b-5b06-a8fa-f971d42f13fe', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group A
A组 G16 A2 vs A3
Men''s Beach Kabaddi Group A
A组 G16 A2 vs A3', '小组赛', 1777104000000, 1777106100000, FALSE, NULL, NULL),
('64b14881-52d0-5fa7-88de-6e12bf438d1d', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group B
B组 G17 B1 vs B4
Men''s Beach Kabaddi Group B
B组 G17 B1 vs B4', '小组赛', 1777107600000, 1777109700000, FALSE, NULL, NULL),
('d13cb700-3082-5217-aad8-c72c9c601d91', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Group B
B组 G18 B2 vs B3
Men''s Beach Kabaddi Group B
B组 G18 B2 vs B3', '小组赛', 1777111200000, 1777113300000, FALSE, NULL, NULL),
('c28d313c-0c13-5e07-a76a-d134fcba1271', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G19 W1 vs W4
Women''s Beach Kabaddi Single Round
单循环赛 G19 W1 vs W4', '小组赛', 1777165200000, 1777167300000, FALSE, NULL, NULL),
('43c063b5-0d2b-5b45-bf4d-6831f77333c3', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G20 W2 vs W4
Women''s Beach Kabaddi Single Round
单循环赛 G20 W2 vs W4', '小组赛', 1777168800000, 1777170900000, FALSE, NULL, NULL),
('ff71f2fa-0761-5cec-863a-81abb0784ccf', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G21 W3 vs W5
Women''s Beach Kabaddi Single Round
单循环赛 G21 W3 vs W5', '小组赛', 1777172400000, 1777174500000, FALSE, NULL, NULL),
('a4a7e734-ad09-53a4-a411-7c5da0784957', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G22 W3 vs W6
Women''s Beach Kabaddi Single Round
单循环赛 G22 W3 vs W6', '小组赛', 1777190400000, 1777192500000, FALSE, NULL, NULL),
('08823e59-993a-5b7e-9223-ba6e97227eeb', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G23 W5 vs W6
Women''s Beach Kabaddi Single Round
单循环赛 G23 W5 vs W6', '小组赛', 1777194000000, 1777196100000, FALSE, NULL, NULL),
('eb1058a4-72c6-5bf1-a981-49bcd24afd91', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Single Round
单循环赛 G24 W1 vs W5
Women''s Beach Kabaddi Single Round
单循环赛 G24 W1 vs W5', '小组赛', 1777197600000, 1777199700000, FALSE, NULL, NULL),
('7457ab8b-6396-5c22-b54f-755bc2a7ac81', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Knockout
淘汰赛 G25 A1 vs B4
Men''s Beach Kabaddi Knockout
淘汰赛 G25 A1 vs B4', '第一轮', 1777251600000, 1777253700000, TRUE, NULL, NULL),
('146e9f2a-09a1-58e5-a280-a25e52b62a1e', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Knockout
淘汰赛 G26 A2 vs B3
Men''s Beach Kabaddi Knockout
淘汰赛 G26 A2 vs B3', '第一轮', 1777255200000, 1777257300000, TRUE, NULL, NULL),
('511e247f-8626-5c2f-bc4d-db2f1bb6d896', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Knockout
淘汰赛 G27 A3 vs B2
Men''s Beach Kabaddi Knockout
淘汰赛 G27 A3 vs B2', '第一轮', 1777258800000, 1777260900000, TRUE, NULL, NULL),
('908e245c-73ac-5467-83fb-7c28d1221076', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Knockout
淘汰赛 G28 A4 vs B1
Men''s Beach Kabaddi Knockout
淘汰赛 G28 A4 vs B1', '第一轮', 1777276800000, 1777278900000, TRUE, NULL, NULL),
('54b3010e-311f-5350-a5bf-39244854730b', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Knockout
淘汰赛 G29 Winner 25 vs Winner 28
Men''s Beach Kabaddi Knockout
淘汰赛 G29 Winner 25 vs Winner 28', '半决赛', 1777280400000, 1777282500000, TRUE, NULL, NULL),
('1139d1eb-2600-5ba6-a02d-f366e23ad501', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Knockout
淘汰赛 G30 Winner 26 vs Winner 27
Men''s Beach Kabaddi Knockout
淘汰赛 G30 Winner 26 vs Winner 27', '半决赛', 1777284000000, 1777286100000, TRUE, NULL, NULL),
('5d19a322-c059-5d48-8398-05dcc2c1f4f9', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪 Final
决赛 G31 W1st vs W2nd
Women''s Beach Kabaddi Final
决赛 G31 W1st vs W2nd', '决赛', 1777338000000, 1777340100000, TRUE, NULL, NULL),
('0a6a4f38-1595-546c-a376-98941fe07db3', 'a1000000-0000-0000-0000-000000000009', '女子沙滩卡巴迪颁奖仪式
Women''s Beach Kabaddi Victory Ceremony', '颁奖仪式', 1777341600000, 1777343700000, FALSE, NULL, NULL),
('37df4561-62aa-5008-acf1-a06e5e4c4270', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪 Final
决赛 G32 Winner 29 vs Winner 30
Men''s Beach Kabaddi Final
决赛 G32 Winner 29 vs Winner 30', '决赛', 1777363200000, 1777365300000, TRUE, NULL, NULL),
('f9128e7e-d3e6-50e5-a07c-cee632dd0876', 'a1000000-0000-0000-0000-000000000009', '男子沙滩卡巴迪颁奖仪式
Men''s Beach Kabaddi Victory Ceremony', '颁奖仪式', 1777366800000, 1777368600000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 帆船 (14 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('f234a62f-6a2b-5ae5-8d4f-5fa320a9c821', 'a1000000-0000-0000-0000-000000000010', '运动队报到技术官员1（技术代表、竞赛主任、裁判长、抗议委员会、技术委员会）报到/运动队报到
Technical Officials Group 1 (Technical Delegate, Competition Director, Chief Referee, Protest Committee, Technical Committee) Registration', '', 1776474000000, 1776502800000, FALSE, NULL, NULL),
('1b60de4c-443f-582b-8ab9-777e3dd98f06', 'a1000000-0000-0000-0000-000000000010', '器材抽签
Equipment draw', '', 1776564000000, 1776589200000, FALSE, NULL, NULL),
('14130ca5-e7b7-5ad9-b59a-1e53f7e79770', 'a1000000-0000-0000-0000-000000000010', '运动员报到
Athlete registration', '', 1776560400000, 1776589200000, FALSE, NULL, NULL),
('cdcb1f73-4b04-5d57-b036-922d0742cc30', 'a1000000-0000-0000-0000-000000000010', '器材检查、公开训练
Equipment inspection and open training', '', 1776560400000, 1776589200000, FALSE, NULL, NULL),
('e0d05dd8-d179-5251-84db-0eb80c9488db', 'a1000000-0000-0000-0000-000000000010', '技术官员2报到
Technical Officials Group 2 Registration', '', 1776646800000, 1776675600000, FALSE, NULL, NULL),
('2537d448-3939-54af-a789-6f8d6a3890a4', 'a1000000-0000-0000-0000-000000000010', '器材检查、公开训练
Equipment inspection and open training', '', 1776646800000, 1776675600000, FALSE, NULL, NULL),
('b52e2c9b-c2a2-50e1-903e-28bf50f8106d', 'a1000000-0000-0000-0000-000000000010', '领队、技术会议
Team Manager and Technical Meeting', '', 1776733200000, 1776735900000, FALSE, NULL, NULL),
('4c909891-0167-5f07-b856-8a34e88dd434', 'a1000000-0000-0000-0000-000000000010', '器材检查、公开训练
Equipment inspection and open training', '', 1776733200000, 1776762000000, FALSE, NULL, NULL),
('4d12b726-ed64-51f8-af52-7668db446b09', 'a1000000-0000-0000-0000-000000000010', '练习赛
Practice races', '', 1776837600000, 1776840300000, FALSE, NULL, NULL),
('3a051603-7955-54cb-a70b-0eb789cc7797', 'a1000000-0000-0000-0000-000000000010', '场地A：男、女子OP帆船级/男、女子爱尔卡4级
FOP A: Optimist (Boys and Girls) and ILCA 4 (Boys and Girls)', '', 1776913200000, 1776936600000, FALSE, NULL, NULL),
('5b6ba128-ce17-5d60-b1e9-1200161ca88c', 'a1000000-0000-0000-0000-000000000010', '场地B：男、女子水翼风筝板级/男、女子水翼帆板级
FOP B: Formula Kite (Men and Women) and Foil Windsurfing (Boys and Girls)', '', 1776913200000, 1776936600000, FALSE, NULL, NULL),
('e9130faa-e63a-55cb-91ac-0f8ac75cfefc', 'a1000000-0000-0000-0000-000000000010', '场地A：男、女子OP帆船级/男、女子爱尔卡4级
FOP A: Optimist (Boys and Girls) and ILCA 4 (Boys and Girls)', '', 1777345200000, 1777356000000, FALSE, NULL, NULL),
('4f87d8a9-2bb4-582f-ab7f-331f92e1021e', 'a1000000-0000-0000-0000-000000000010', '场地B：男、女子水翼风筝板级/男、女子水翼帆板级
FOP B: Formula Kite (Men and Women) and Foil Windsurfing (Boys and Girls)', '', 1777345200000, 1777356000000, FALSE, NULL, NULL),
('788eae79-c538-5949-a3e2-db5aaa698545', 'a1000000-0000-0000-0000-000000000010', '颁奖仪式
Victory ceremony', '', 1777366800000, 1777369500000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 攀岩 (6 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('50e02124-47f3-5ef3-b4e4-ca16586f8439', 'a1000000-0000-0000-0000-000000000011', 'Speed Qualification
速度预赛', '预赛', 1777344000000, 1777348800000, FALSE, NULL, NULL),
('22ad8204-d07e-5a38-9628-c35b62cdfcb0', 'a1000000-0000-0000-0000-000000000011', 'Speed Final
速度决赛', '决赛', 1777377600000, 1777381200000, TRUE, NULL, NULL),
('94b24824-f22e-58ae-9602-41efa8d24141', 'a1000000-0000-0000-0000-000000000011', 'Awarding Ceremony
颁奖仪式', '', 1777381800000, 1777382400000, FALSE, NULL, NULL),
('f515f3d6-0319-575d-b4ae-422b43916acb', 'a1000000-0000-0000-0000-000000000011', 'Speed Relay Qualification
速度接力预赛', '预赛', 1777426200000, 1777431600000, FALSE, NULL, NULL),
('8f913e2c-d07d-509d-8f4a-e20c186a853b', 'a1000000-0000-0000-0000-000000000011', 'Speed Relay Final
速度接力决赛', '决赛', 1777464000000, 1777467600000, TRUE, NULL, NULL),
('80057bbf-8e16-585b-a942-87322d8f8b28', 'a1000000-0000-0000-0000-000000000011', 'Awarding Ceremony
颁奖仪式', '', 1777468200000, 1777468800000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 台克球 (32 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('4b7c9ddd-1b41-5449-bc02-1f122e50ca7e', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles G1 A1-B2
男子双打
Men''s Doubles G1 A1-B2', '小组赛', 1777014000000, 1777015800000, FALSE, NULL, NULL),
('83b36bb4-d35e-5cab-acee-7b89af74c773', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles  A2-B1
男子双打
Men''s Doubles  A2-B1', '小组赛', 1777015800000, 1777017600000, FALSE, NULL, NULL),
('e2376945-0fbd-5648-b885-c0c71c2f7d3b', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles  A3-B4
男子双打
Men''s Doubles  A3-B4', '小组赛', 1777019400000, 1777021200000, FALSE, NULL, NULL),
('d25f3ab9-005c-53b0-94c7-60f0d405e3b6', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles  A4-B3
男子双打
Men''s Doubles  A4-B3', '小组赛', 1777021200000, 1777023000000, FALSE, NULL, NULL),
('19314e8b-44a3-54fd-b3d3-11b5baa84d11', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles G2 A组胜1-B组胜2
Awin1-Bwin2
男子双打
Men''s Doubles G2 A组胜1-B组胜2
Awin1-Bwin2', '¼决赛', 1777028400000, 1777030200000, TRUE, NULL, NULL),
('9de94ad2-bf3c-5845-8faa-4bdda1663b44', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles  A组胜2-B组胜1
Awin2-Bwin1
男子双打
Men''s Doubles  A组胜2-B组胜1
Awin2-Bwin1', '¼决赛', 1777030200000, 1777032000000, TRUE, NULL, NULL),
('35aac6d3-e9f0-505f-abf4-b49219fc175b', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles  A组败1-B组败2
Alose1-Blose2
男子双打
Men''s Doubles  A组败1-B组败2
Alose1-Blose2', '¼决赛', 1777032000000, 1777033800000, TRUE, NULL, NULL),
('18530f2c-226e-5155-a42c-b107fa944673', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles  A组败2-B组败1
Alose2-Blose1
男子双打
Men''s Doubles  A组败2-B组败1
Alose2-Blose1', '¼决赛', 1777033800000, 1777035600000, TRUE, NULL, NULL),
('d14d41c8-58ea-509d-a5b8-c12a7950757b', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles G3 A1-B3
女子双打
Women''s Doubles G3 A1-B3', '小组赛', 1777100400000, 1777102200000, FALSE, NULL, NULL),
('b15e133c-1e44-5e5b-a329-480a7826bad8', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles  A2-B1
女子双打
Women''s Doubles  A2-B1', '小组赛', 1777102200000, 1777104000000, FALSE, NULL, NULL),
('bdc29dc3-1eca-5358-92cd-db6ebd467584', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles  A3-B2
女子双打
Women''s Doubles  A3-B2', '小组赛', 1777104000000, 1777105800000, FALSE, NULL, NULL),
('13588e6b-0902-5fb5-bdbc-dd1ac3126451', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles G4 A组胜1-B组胜2
Awin1-Bwin2
女子双打
Women''s Doubles G4 A组胜1-B组胜2
Awin1-Bwin2', '¼决赛', 1777105800000, 1777109400000, TRUE, NULL, NULL),
('024219f4-b594-54ab-b044-14ea10fe7588', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles  A组胜2-B组胜1
Awin2-Bwin1
女子双打
Women''s Doubles  A组胜2-B组胜1
Awin2-Bwin1', '¼决赛', 1777109400000, 1777111200000, TRUE, NULL, NULL),
('3f31d390-e879-57e4-8fd0-8d11cd004a69', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles  A组败1-B组败1
Alose1-Blose1
女子双打
Women''s Doubles  A组败1-B组败1
Alose1-Blose1', '¼决赛', 1777111200000, 1777113000000, TRUE, NULL, NULL),
('b1611f90-dc6d-5117-9b7e-6890cd76452a', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles G5 A1-B3
混合双打
Mixed Doubles G5 A1-B3', '小组赛', 1777186800000, 1777188600000, FALSE, NULL, NULL),
('91bd7981-6501-5239-a738-4e38c760fc47', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles  A2-B1
混合双打
Mixed Doubles  A2-B1', '小组赛', 1777188600000, 1777190400000, FALSE, NULL, NULL),
('072f2f18-e184-5422-bb3d-dfff3ffe1985', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles  A3-B2
混合双打
Mixed Doubles  A3-B2', '小组赛', 1777190400000, 1777192200000, FALSE, NULL, NULL),
('bece6a9b-5054-5a83-b1ce-9fd7a90825f8', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles G6 A组胜1-B组胜2
Awin1-Bwin2
混合双打
Mixed Doubles G6 A组胜1-B组胜2
Awin1-Bwin2', '¼决赛', 1777192200000, 1777195800000, TRUE, NULL, NULL),
('ea9fb0a9-afd7-51a0-8d1e-5271caaae088', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles  A组胜2-B组胜1
Awin2-Bwin1
混合双打
Mixed Doubles  A组胜2-B组胜1
Awin2-Bwin1', '¼决赛', 1777195800000, 1777197600000, TRUE, NULL, NULL),
('0d8f47fc-1d4c-5104-ba96-943868649b6c', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles  A组败1-B组败1
Alose1-Blose1
混合双打
Mixed Doubles  A组败1-B组败1
Alose1-Blose1', '¼决赛', 1777197600000, 1777199400000, TRUE, NULL, NULL),
('82574b88-3eb3-5b04-b86f-2d39da963a95', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles G7 ¼胜1-¼胜2
¼win1-¼win2
男子双打
Men''s Doubles G7 ¼胜1-¼胜2
¼win1-¼win2', '半决赛', 1777248000000, 1777251600000, TRUE, NULL, NULL),
('861e28b8-38bf-5077-afe1-808c6098d0d9', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles G8 ¼胜1-¼胜2
¼win1-¼win2
女子双打
Women''s Doubles G8 ¼胜1-¼胜2
¼win1-¼win2', '半决赛', 1777251600000, 1777255200000, TRUE, NULL, NULL),
('a90d5d1e-416d-5244-b2b2-7c69133888f4', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles G9 ¼胜1-¼胜2
¼win1-¼win2
混合双打
Mixed Doubles G9 ¼胜1-¼胜2
¼win1-¼win2', '半决赛', 1777255200000, 1777258800000, TRUE, NULL, NULL),
('d4e353bb-56dd-537a-b42c-7a6e9a797afa', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles G10 ¼败1-¼败2
¼lose1-¼lose2
男子双打
Men''s Doubles G10 ¼败1-¼败2
¼lose1-¼lose2', '半决赛', 1777258800000, 1777262400000, TRUE, NULL, NULL),
('d459cab0-1e9b-5f9d-8a07-3794435f2f12', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles G11 ¼败1-¼败2
¼lose1-¼lose2
女子双打
Women''s Doubles G11 ¼败1-¼败2
¼lose1-¼lose2', '半决赛', 1777262400000, 1777266000000, TRUE, NULL, NULL),
('c89e4d85-ce68-52ae-bef1-013c96693696', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles G12 ¼败1-¼败2
¼lose1-¼lose2
混合双打
Mixed Doubles G12 ¼败1-¼败2
¼lose1-¼lose2', '半决赛', 1777269600000, 1777273200000, TRUE, NULL, NULL),
('ac9af434-1620-5dbc-b7da-c963aac508b6', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles G13 铜牌赛
BRONZE
男子双打
Men''s Doubles G13 铜牌赛
BRONZE', '铜牌赛', 1777273200000, 1777276800000, TRUE, NULL, NULL),
('1e9a46fc-5cc3-56ea-a021-20275c0e27bd', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles G14 铜牌赛
BRONZE
女子双打
Women''s Doubles G14 铜牌赛
BRONZE', '铜牌赛', 1777276800000, 1777280400000, TRUE, NULL, NULL),
('18dbd4bf-7fb4-5192-b0a1-c8cd655c4be7', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles G15 铜牌赛
BRONZE
混合双打
Mixed Doubles G15 铜牌赛
BRONZE', '铜牌赛', 1777280400000, 1777284000000, TRUE, NULL, NULL),
('ff3aa03c-d293-58d5-954d-803f43e79834', 'a1000000-0000-0000-0000-000000000012', '男子双打
Men''s Doubles G16 金牌赛
FINAL
男子双打
Men''s Doubles G16 金牌赛
FINAL', '金牌赛', 1777287600000, 1777291200000, TRUE, NULL, NULL),
('3c5181ca-26a8-565d-8bb0-9ef2b67d0a51', 'a1000000-0000-0000-0000-000000000012', '女子双打
Women''s Doubles G17 金牌赛
FINAL
女子双打
Women''s Doubles G17 金牌赛
FINAL', '金牌赛', 1777291200000, 1777294800000, TRUE, NULL, NULL),
('a1d87389-435b-5f12-9eab-232debf36825', 'a1000000-0000-0000-0000-000000000012', '混合双打
Mixed Doubles G18 金牌赛
FINAL
混合双打
Mixed Doubles G18 金牌赛
FINAL', '金牌赛', 1777294800000, 1777298400000, TRUE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 游跑两项 (3 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('47689052-bf5a-581e-bf11-faa25fb85240', 'a1000000-0000-0000-0000-000000000013', '男子个人比赛
Men''s Individual', '决赛', 1776902400000, 1776905100000, TRUE, NULL, NULL),
('b0ae955e-2973-52ce-9faa-df0ce1177417', 'a1000000-0000-0000-0000-000000000013', '女子个人比赛
Women''s Individual', '决赛', 1776907800000, 1776910800000, TRUE, NULL, NULL),
('7fc746d6-d219-5bc8-a103-9c2b6eb69c28', 'a1000000-0000-0000-0000-000000000013', '混合接力比赛
Mixed Relay', '决赛', 1777075200000, 1777079700000, TRUE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 沙滩排球 (223 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('b49305b6-9d6f-5d86-8234-2fd9ab2f32b6', 'a1000000-0000-0000-0000-000000000014', '开赛仪式
Opening Ceremony', '开赛仪式', 1776904200000, 1776906900000, FALSE, NULL, NULL),
('4b106d6e-ebb4-513e-a9e6-e70c97ff6cb9', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子A组M1 vs M2
Beach Volleyball M', '小组赛', 1776902400000, 1776905700000, FALSE, NULL, NULL),
('66fbdbac-7bdd-5c0b-8bfd-ac879ff79612', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子N组W1 vs W2
Beach Volleyball W', '小组赛', 1776902400000, 1776905700000, FALSE, NULL, NULL),
('f458bd32-60bf-5d6c-a3cd-3cb9d389ce3c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子B组M5 vs M6
Beach Volleyball M', '小组赛', 1776902400000, 1776905700000, FALSE, NULL, NULL),
('150e25e1-c9e3-57ff-9aed-17d838c48079', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子O组W5 vs W6
Beach Volleyball W', '小组赛', 1776902400000, 1776905700000, FALSE, NULL, NULL),
('c680376b-ea04-57c3-af05-8855e68ae530', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子C组M9 vs M10
Beach Volleyball M', '小组赛', 1776902400000, 1776905700000, FALSE, NULL, NULL),
('30a29b4f-7dab-56bb-ae59-fb1c3902bc35', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子D组M13 vs M14
Beach Volleyball M', '小组赛', 1776906000000, 1776909300000, FALSE, NULL, NULL),
('a14dbfe7-f7cf-5c10-9900-de2ef3afcd03', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子P组W9 vs W10
Beach Volleyball W', '小组赛', 1776906000000, 1776909300000, FALSE, NULL, NULL),
('2810e9e3-7961-5cf2-b25e-8e956cddede9', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子E组M17 vs M18
Beach Volleyball M', '小组赛', 1776906000000, 1776909300000, FALSE, NULL, NULL),
('3f5646a6-e949-58cc-88cc-75351b8168c7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Q组W13 vs W14
Beach Volleyball W', '小组赛', 1776906000000, 1776909300000, FALSE, NULL, NULL),
('75d76e7f-e594-5144-bdeb-cb902d8cb023', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子F组M21 vs M22
Beach Volleyball M', '小组赛', 1776906000000, 1776909300000, FALSE, NULL, NULL),
('9e8e118c-cd4a-5e30-8679-e7d1f728738b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子R组W17 vs W18
Beach Volleyball W', '小组赛', 1776909600000, 1776912900000, FALSE, NULL, NULL),
('59ccac13-9f74-5436-95e5-af68f2cbed3f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子G组M25 vs M26
Beach Volleyball M', '小组赛', 1776909600000, 1776912900000, FALSE, NULL, NULL),
('ab56ee23-9b63-5384-b8aa-73b340e533db', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子S组W21 vs W22
Beach Volleyball W', '小组赛', 1776909600000, 1776912900000, FALSE, NULL, NULL),
('6fa41ad7-72e1-59ef-9617-6b1303fe2b39', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子H组M29 vs M30
Beach Volleyball M', '小组赛', 1776909600000, 1776912900000, FALSE, NULL, NULL),
('ac6dea1b-d1dc-5658-ace4-ac3a1ceb0cad', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子T组W25 vs W26
Beach Volleyball W', '小组赛', 1776909600000, 1776912900000, FALSE, NULL, NULL),
('9b6e1152-263d-5f8c-a7bf-75db3c63638f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子A组M3 vs M4
Beach Volleyball M', '小组赛', 1776924000000, 1776927300000, FALSE, NULL, NULL),
('901dcc65-0ee0-5065-b45f-2d49035fc1f2', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子N组W3 vs W4
Beach Volleyball W', '小组赛', 1776924000000, 1776927300000, FALSE, NULL, NULL),
('2f35c02a-f98d-57ed-8852-93ba285f6e76', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子I组M33 vs M34
Beach Volleyball M', '小组赛', 1776924000000, 1776927300000, FALSE, NULL, NULL),
('cb8aa521-f215-52e2-bcce-74a5bda59bc3', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子U组W29 vs W30
Beach Volleyball W', '小组赛', 1776924000000, 1776927300000, FALSE, NULL, NULL),
('e1b7a38e-eb9c-5329-9167-068086545770', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子J组M37 vs M38
Beach Volleyball M', '小组赛', 1776924000000, 1776927300000, FALSE, NULL, NULL),
('3019fa5e-953a-59dc-8421-4cd35347b111', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子V组W33 vs W34
Beach Volleyball W', '小组赛', 1776927600000, 1776930900000, FALSE, NULL, NULL),
('55dc866d-5671-56ba-abb4-32e8144b6503', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子K组M41 vs M42
Beach Volleyball M', '小组赛', 1776927600000, 1776930900000, FALSE, NULL, NULL),
('3da2634f-0b0a-5ade-8180-73c0b81fb905', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子W组W37 vs W38
Beach Volleyball W', '小组赛', 1776927600000, 1776930900000, FALSE, NULL, NULL),
('99132acf-85d2-5762-9db1-3d605d8e5e92', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子L组M45 vs M46
Beach Volleyball M', '小组赛', 1776927600000, 1776930900000, FALSE, NULL, NULL),
('38fbc8a8-7c35-510d-92a6-a3cc55202d40', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子X组W41 vs W42
Beach Volleyball W', '小组赛', 1776927600000, 1776930900000, FALSE, NULL, NULL),
('9c2d0087-420b-59f2-aa1b-da570eca45e4', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子M组M49 vs M50
Beach Volleyball M', '小组赛', 1776931200000, 1776934500000, FALSE, NULL, NULL),
('41129b33-48d1-55f0-b008-8b90da402585', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Y组W45 vs W46
Beach Volleyball W', '小组赛', 1776931200000, 1776934500000, FALSE, NULL, NULL),
('859cb901-3b2b-55e3-b9e8-eac6e7f800d3', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子B组M7 vs M8
Beach Volleyball M', '小组赛', 1776931200000, 1776934500000, FALSE, NULL, NULL),
('707d4c6f-f9c8-5c74-9dd0-d322b04417bb', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子O组W7 vs W8
Beach Volleyball W', '小组赛', 1776931200000, 1776934500000, FALSE, NULL, NULL),
('f3d2a18f-d327-5fc2-8e25-fc7a81a88051', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Z组W49 vs W50
Beach Volleyball W', '小组赛', 1776931200000, 1776934500000, FALSE, NULL, NULL),
('dabd6631-382a-5031-abd0-c1a9b1c23344', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子C组M11 vs M12
Beach Volleyball M', '小组赛', 1776934800000, 1776938100000, FALSE, NULL, NULL),
('86c50530-001f-5fe7-90f6-61a684a176e7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子P组W11 vs W12
Beach Volleyball W', '小组赛', 1776934800000, 1776938100000, FALSE, NULL, NULL),
('3ce68a8e-878a-5da2-ac08-a113d00e7a13', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子D组M15 vs M16
Beach Volleyball M', '小组赛', 1776934800000, 1776938100000, FALSE, NULL, NULL),
('566d2eb4-7238-5180-ac1e-bf2aeae0f9a7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Q组W15 vs W16
Beach Volleyball W', '小组赛', 1776934800000, 1776938100000, FALSE, NULL, NULL),
('0a817b78-d9ca-5b6c-82df-4f783493b431', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子E组M19 vs M20
Beach Volleyball M', '小组赛', 1776934800000, 1776938100000, FALSE, NULL, NULL),
('63c46757-09e0-5caf-bfc0-bdcb527855cb', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子R组W19 vs W20
Beach Volleyball W', '小组赛', 1776938400000, 1776941700000, FALSE, NULL, NULL),
('54087459-6b19-5913-904d-613fc594ccf6', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子F组M23 vs M24
Beach Volleyball M', '小组赛', 1776938400000, 1776941700000, FALSE, NULL, NULL),
('7f0fbff4-fe8e-5d22-945b-5b03a20f861c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子S组W23 vs W24
Beach Volleyball W', '小组赛', 1776938400000, 1776941700000, FALSE, NULL, NULL),
('84f794ba-cc01-5405-8bbd-81c8f17539de', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子G组M27 vs M28
Beach Volleyball M', '小组赛', 1776942000000, 1776945300000, FALSE, NULL, NULL),
('86bf12ae-32d0-5608-84d4-41d63a631f3d', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子T组W27 vs W28
Beach Volleyball W', '小组赛', 1776942000000, 1776945300000, FALSE, NULL, NULL),
('563bf323-c4bb-5892-a8cb-2f61cbb60d87', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子N组W1 vs W3
Beach Volleyball W', '小组赛', 1776988800000, 1776992100000, FALSE, NULL, NULL),
('d29376f3-c2d8-54b2-9073-dab748caa88c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子H组M29 vs M31
Beach Volleyball M', '小组赛', 1776988800000, 1776992100000, FALSE, NULL, NULL),
('7a9f3f59-837a-5141-9de6-3c54170f936b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子O组W5 vs W7
Beach Volleyball W', '小组赛', 1776988800000, 1776992100000, FALSE, NULL, NULL),
('ea19499a-029f-539d-afa5-8becaa533b10', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子I组M33 vs M35
Beach Volleyball M', '小组赛', 1776988800000, 1776992100000, FALSE, NULL, NULL),
('c2e9495c-bb4c-5586-bb6e-37dd525a95cf', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子P组W9 vs W11
Beach Volleyball W', '小组赛', 1776988800000, 1776992100000, FALSE, NULL, NULL),
('9d7b3e21-a53a-5f47-8717-3d33df671d46', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子J组M37 vs M39
Beach Volleyball M', '小组赛', 1776992400000, 1776995700000, FALSE, NULL, NULL),
('b134f345-4ffa-529c-8feb-92bec1c8d608', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Q组W13 vs W15
Beach Volleyball W', '小组赛', 1776992400000, 1776995700000, FALSE, NULL, NULL),
('3f1e7f5c-f0b9-51e7-a266-f65283fc325a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子K组M41 vs M43
Beach Volleyball M', '小组赛', 1776992400000, 1776995700000, FALSE, NULL, NULL),
('59a126f8-b4d0-5798-b333-e9ee0adf1f87', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子R组W17 vs W19
Beach Volleyball W', '小组赛', 1776992400000, 1776995700000, FALSE, NULL, NULL),
('3ed326a1-ce3f-58b1-bcef-f427fbb83321', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子L组M45 vs M47
Beach Volleyball M', '小组赛', 1776992400000, 1776995700000, FALSE, NULL, NULL),
('7aee1fb1-0c1a-5549-9525-48447ebf9716', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子S组W21 vs W23
Beach Volleyball W', '小组赛', 1776996000000, 1776999300000, FALSE, NULL, NULL),
('6850cfcb-d735-535d-9b27-4774f91f3e15', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子M组M49 vs M51
Beach Volleyball M', '小组赛', 1776996000000, 1776999300000, FALSE, NULL, NULL),
('33a686c8-faa3-5e68-9c24-5e9e3207ad6b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子T组W25 vs W27
Beach Volleyball W', '小组赛', 1776996000000, 1776999300000, FALSE, NULL, NULL),
('36055058-3ff3-51d3-adff-f203585f3d29', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子A组M1 vs M3
Beach Volleyball M', '小组赛', 1776996000000, 1776999300000, FALSE, NULL, NULL),
('8986ef47-95ff-530b-8b2b-279b4cfba9b0', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子U组W29 vs W31
Beach Volleyball W', '小组赛', 1776996000000, 1776999300000, FALSE, NULL, NULL),
('b4efcf2d-cce7-5e5a-9f1c-c7693bdd4739', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子B组M5 vs M7
Beach Volleyball M', '小组赛', 1777010400000, 1777013700000, FALSE, NULL, NULL),
('8d4d576a-651d-510f-b207-3b3baecc05c8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子V组W33 vs W35
Beach Volleyball W', '小组赛', 1777010400000, 1777013700000, FALSE, NULL, NULL),
('735afd69-e53d-5546-9165-69c3ab8db5f5', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子C组M9 vs M11
Beach Volleyball M', '小组赛', 1777010400000, 1777013700000, FALSE, NULL, NULL),
('38be86a5-213c-59bd-9c92-48a128ba245f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子W组W37 vs W39
Beach Volleyball W', '小组赛', 1777010400000, 1777013700000, FALSE, NULL, NULL),
('32e997db-46ce-5f72-870b-efd719daac37', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子D组M13 vs M15
Beach Volleyball M', '小组赛', 1777010400000, 1777013700000, FALSE, NULL, NULL),
('c23f9534-f527-5418-9e13-a1338aa2e6e8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子X组W41 vs W43
Beach Volleyball W', '小组赛', 1777014000000, 1777017300000, FALSE, NULL, NULL),
('9e6d0e05-8f56-5e7d-8c0f-6bcdd0ee5e4a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子E组M17 vs M19
Beach Volleyball M', '小组赛', 1777014000000, 1777017300000, FALSE, NULL, NULL),
('e31bb046-0f08-589d-86e7-f115e7850f0b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Y组W45 vs W47
Beach Volleyball W', '小组赛', 1777014000000, 1777017300000, FALSE, NULL, NULL),
('cc69f121-5a6c-5ba6-9935-18e31245adc5', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子F组M21 vs M23
Beach Volleyball M', '小组赛', 1777014000000, 1777017300000, FALSE, NULL, NULL),
('a2ffbadf-c9ff-5804-95c6-5c4a759fc2a7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Z组W49 vs W51
Beach Volleyball W', '小组赛', 1777014000000, 1777017300000, FALSE, NULL, NULL),
('43236391-7fcf-51b7-9442-19c9663c235e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子G组M25 vs M27
Beach Volleyball M', '小组赛', 1777017600000, 1777020900000, FALSE, NULL, NULL),
('3e88d2cb-7850-5a5f-b464-836e4b63fc36', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子N组W2 vs W4
Beach Volleyball W', '小组赛', 1777017600000, 1777020900000, FALSE, NULL, NULL),
('e6ed5fa6-b063-5c74-bd5e-54fc11264ab7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子H组M30 vs M32
Beach Volleyball M', '小组赛', 1777017600000, 1777020900000, FALSE, NULL, NULL),
('6a8c519e-1670-5ff6-afb0-59e8f333bc76', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子O组W6 vs W8
Beach Volleyball W', '小组赛', 1777017600000, 1777020900000, FALSE, NULL, NULL),
('f0163255-dac1-5752-af8d-cff6ee94b2b9', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子I组M34 vs M36
Beach Volleyball M', '小组赛', 1777017600000, 1777020900000, FALSE, NULL, NULL),
('71c1e536-a79e-5adb-85fc-1acff5b865ff', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子P组W10 vs W12
Beach Volleyball W', '小组赛', 1777021200000, 1777024500000, FALSE, NULL, NULL),
('27375d7e-d2d4-57aa-a9c7-f281594a4e8a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子J组M38 vs M40
Beach Volleyball M', '小组赛', 1777021200000, 1777024500000, FALSE, NULL, NULL),
('ab95da40-fa64-5dc0-acbe-90dce05ea4ac', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Q组W14 vs W16
Beach Volleyball W', '小组赛', 1777021200000, 1777024500000, FALSE, NULL, NULL),
('fac2148f-1578-5e99-9a5f-64940531a861', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子K组M42 vs M44
Beach Volleyball M', '小组赛', 1777021200000, 1777024500000, FALSE, NULL, NULL),
('74041ba9-e718-572d-8ac3-4a823e75181e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子R组W18 vs W20
Beach Volleyball W', '小组赛', 1777021200000, 1777024500000, FALSE, NULL, NULL),
('3105c3e4-47da-5450-ba7e-a480ffd45e06', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子L组M46 vs M48
Beach Volleyball M', '小组赛', 1777024800000, 1777028100000, FALSE, NULL, NULL),
('44914848-fa7d-57f6-bf19-98495e9163c6', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子S组W22 vs W24
Beach Volleyball W', '小组赛', 1777024800000, 1777028100000, FALSE, NULL, NULL),
('5064e149-311d-5680-b3b1-a835dd584d9a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子M组M50 vs M52
Beach Volleyball M', '小组赛', 1777024800000, 1777028100000, FALSE, NULL, NULL),
('23ac4562-46c7-5a67-ade9-ab5c618e6ec6', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子T组W26 vs W28
Beach Volleyball W', '小组赛', 1777028400000, 1777031700000, FALSE, NULL, NULL),
('6f707830-dc39-54cb-ad57-6dd4274d43fb', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子A组M2 vs M4
Beach Volleyball M', '小组赛', 1777028400000, 1777031700000, FALSE, NULL, NULL),
('e82e7d46-6a40-5454-88ad-cbd36089d17a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子U组W29 vs W30
Beach Volleyball W', '小组赛', 1777075200000, 1777078500000, FALSE, NULL, NULL),
('caaebafe-b732-5222-9658-095dfc75a497', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子B组M6 vs M8
Beach Volleyball M', '小组赛', 1777075200000, 1777078500000, FALSE, NULL, NULL),
('6323e285-9aaf-5043-8c74-070cc4677457', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子V组W33 vs W34
Beach Volleyball W', '小组赛', 1777075200000, 1777078500000, FALSE, NULL, NULL),
('7cce2ed2-2bc9-55af-a170-dd3addbcb785', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子C组M10 vs M12
Beach Volleyball M', '小组赛', 1777075200000, 1777078500000, FALSE, NULL, NULL),
('240bbf3e-1b2c-5710-b197-0c10c504b293', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子W组W37 vs W38
Beach Volleyball W', '小组赛', 1777075200000, 1777078500000, FALSE, NULL, NULL),
('f176773d-0f7f-543a-a328-a6e0550d28c7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子D组M14 vs M16
Beach Volleyball M', '小组赛', 1777078800000, 1777082100000, FALSE, NULL, NULL),
('e7b2eb5a-c866-5af9-9b64-4e1f54b6dc13', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子X组W41 vs W42
Beach Volleyball W', '小组赛', 1777078800000, 1777082100000, FALSE, NULL, NULL),
('3ad1ac2a-d250-5944-b61b-eb13506db5ca', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子E组M18 vs M20
Beach Volleyball M', '小组赛', 1777078800000, 1777082100000, FALSE, NULL, NULL),
('8f56129f-0bc5-58ea-ad76-8697ea4809d3', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Y组W45 vs W46
Beach Volleyball W', '小组赛', 1777078800000, 1777082100000, FALSE, NULL, NULL),
('d6f67563-7003-5391-be41-7cc4b3107dab', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子F组M22 vs M24
Beach Volleyball M', '小组赛', 1777078800000, 1777082100000, FALSE, NULL, NULL),
('415c9523-264f-524d-86b9-9e2d4dae6bb7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Z组W49 vs W50
Beach Volleyball W', '小组赛', 1777082400000, 1777085700000, FALSE, NULL, NULL),
('efd2fd53-b38b-5c95-8941-7bacd5f3d510', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子G组M26 vs M28
Beach Volleyball M', '小组赛', 1777082400000, 1777085700000, FALSE, NULL, NULL),
('215135b2-f462-5c9f-aa8d-8650129dbbee', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子N组W1 vs W4
Beach Volleyball W', '小组赛', 1777082400000, 1777085700000, FALSE, NULL, NULL),
('c507f72a-1b6e-5cd6-8804-b41c43fd352b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子H组M29 vs M32
Beach Volleyball M', '小组赛', 1777082400000, 1777085700000, FALSE, NULL, NULL),
('4a512a7c-585f-5712-b30c-34adc599ad68', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子O组W5 vs W8
Beach Volleyball W', '小组赛', 1777082400000, 1777085700000, FALSE, NULL, NULL),
('10cd72da-52e0-5e5a-80d3-e0544c752e28', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子I组M33 vs M36
Beach Volleyball M', '小组赛', 1777096800000, 1777100100000, FALSE, NULL, NULL),
('97c582f2-f80b-56f3-ac72-224a812c915c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子P组W9 vs W12
Beach Volleyball W', '小组赛', 1777096800000, 1777100100000, FALSE, NULL, NULL),
('43e1a0ea-d1d0-530d-b59d-0899f6207fd7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子J组M37 vs M40
Beach Volleyball M', '小组赛', 1777096800000, 1777100100000, FALSE, NULL, NULL),
('e4427b30-7feb-5a76-ad38-ef72f6341902', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Q组W13 vs W16
Beach Volleyball W', '小组赛', 1777096800000, 1777100100000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('955daad1-de4b-5317-b9a4-5b7b119a2349', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子K组M41 vs M44
Beach Volleyball M', '小组赛', 1777096800000, 1777100100000, FALSE, NULL, NULL),
('e7b499fa-3c18-5ed4-b4c0-c89c276ca71f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子R组W17 vs W20
Beach Volleyball W', '小组赛', 1777100400000, 1777103700000, FALSE, NULL, NULL),
('f7a6f5cf-e620-57ad-be78-05bd0bfc5fd2', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子L组M45 vs M48
Beach Volleyball M', '小组赛', 1777100400000, 1777103700000, FALSE, NULL, NULL),
('c3159f1a-de0d-510e-a799-e38aa4608032', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子S组W21 vs W24
Beach Volleyball W', '小组赛', 1777100400000, 1777103700000, FALSE, NULL, NULL),
('05237293-166f-58f1-a68e-b5337fcd0c65', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子M组M49 vs M52
Beach Volleyball M', '小组赛', 1777100400000, 1777103700000, FALSE, NULL, NULL),
('25c6ab17-149d-54c8-8769-534cafaa8075', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子T组W25 vs W28
Beach Volleyball W', '小组赛', 1777100400000, 1777103700000, FALSE, NULL, NULL),
('72b8e879-6422-5114-922a-842757b1477b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子A组M1 vs M4
Beach Volleyball M', '小组赛', 1777104000000, 1777107300000, FALSE, NULL, NULL),
('64e2a5b2-bc5f-5883-ae64-8f7630c8f057', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子U组W29 vs W31
Beach Volleyball W', '小组赛', 1777104000000, 1777107300000, FALSE, NULL, NULL),
('fe2f50db-51f1-5d57-89f6-a4aac605d901', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子B组M5 vs M8
Beach Volleyball M', '小组赛', 1777104000000, 1777107300000, FALSE, NULL, NULL),
('60b93917-a30c-5be6-8869-36e534aacd79', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子V组W33 vs W35
Beach Volleyball W', '小组赛', 1777104000000, 1777107300000, FALSE, NULL, NULL),
('e1a09952-ec2e-5f28-8fc1-fa630d3a1ec8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子C组M9 vs M12
Beach Volleyball M', '小组赛', 1777104000000, 1777107300000, FALSE, NULL, NULL),
('b34f7299-88fa-53a7-9669-ece012f5b0c2', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子W组W37 vs W39
Beach Volleyball W', '小组赛', 1777107600000, 1777110900000, FALSE, NULL, NULL),
('cdd884bd-4884-593a-91a4-747d54794831', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子D组M13 vs M16
Beach Volleyball M', '小组赛', 1777107600000, 1777110900000, FALSE, NULL, NULL),
('2d7ab219-ec7e-5c3f-b477-ad5a6d582fc9', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子X组W41 vs W43
Beach Volleyball W', '小组赛', 1777107600000, 1777110900000, FALSE, NULL, NULL),
('1e49fb1e-9042-5b10-9992-d31134e32817', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子E组M17 vs M20
Beach Volleyball M', '小组赛', 1777107600000, 1777110900000, FALSE, NULL, NULL),
('253b8de6-cf05-5a8d-b28c-0162794f8e0b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Y组W45 vs W47
Beach Volleyball W', '小组赛', 1777107600000, 1777110900000, FALSE, NULL, NULL),
('58e1e7f9-047e-5657-b263-1f52bc5d822c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子F组M21 vs M24
Beach Volleyball M', '小组赛', 1777111200000, 1777114500000, FALSE, NULL, NULL),
('c88ba4ff-0764-56fd-be95-594212a4f38b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Z组W49 vs W51
Beach Volleyball W', '小组赛', 1777111200000, 1777114500000, FALSE, NULL, NULL),
('051c5863-fa69-5795-867d-ac17278f509f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子G组M25 vs M28
Beach Volleyball M', '小组赛', 1777111200000, 1777114500000, FALSE, NULL, NULL),
('88af93b9-6dbf-55be-b136-acbd8e932487', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子N组W2 vs W3
Beach Volleyball W', '小组赛', 1777114800000, 1777118100000, FALSE, NULL, NULL),
('31c8f176-ff4f-5869-a520-34b14d28280c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子H组M30 vs M31
Beach Volleyball M', '小组赛', 1777114800000, 1777118100000, FALSE, NULL, NULL),
('8c7a6a0f-7777-5a50-8ade-2a376502884e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子O组W6 vs W7
Beach Volleyball W', '小组赛', 1777161600000, 1777164900000, FALSE, NULL, NULL),
('13c52f15-a1cd-5f16-b261-57d1f898819b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子I组M34 vs M35
Beach Volleyball M', '小组赛', 1777161600000, 1777164900000, FALSE, NULL, NULL),
('cf419b19-ff70-59b5-abb7-1f2ecb1df44f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子P组W10 vs W11
Beach Volleyball W', '小组赛', 1777161600000, 1777164900000, FALSE, NULL, NULL),
('4dd091ed-39d8-5bdb-813c-06d0dcc0b6b0', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子J组M38 vs M39
Beach Volleyball M', '小组赛', 1777161600000, 1777164900000, FALSE, NULL, NULL),
('1d818e46-a535-5363-9534-4575b87593ab', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Q组W14 vs W15
Beach Volleyball W', '小组赛', 1777161600000, 1777164900000, FALSE, NULL, NULL),
('13f1e9f8-66d9-50cb-b9f4-52c666fd0dc6', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子K组M42 vs M43
Beach Volleyball M', '小组赛', 1777165200000, 1777168500000, FALSE, NULL, NULL),
('a08aa0e6-4232-514a-95ba-62b12dd05115', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子R组W18 vs W19
Beach Volleyball W', '小组赛', 1777165200000, 1777168500000, FALSE, NULL, NULL),
('53ac04ae-3a2b-57fd-9d18-9bc7df7057cf', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子L组M46 vs M47
Beach Volleyball M', '小组赛', 1777165200000, 1777168500000, FALSE, NULL, NULL),
('8504a128-1cc7-5ab4-8bd4-2006ede136fc', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子S组W22 vs W23
Beach Volleyball W', '小组赛', 1777165200000, 1777168500000, FALSE, NULL, NULL),
('9e8b1cad-5c9c-5a90-b562-920e1ec341d1', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子M组M50 vs M51
Beach Volleyball M', '小组赛', 1777165200000, 1777168500000, FALSE, NULL, NULL),
('c5a664fa-3518-5a64-b585-a58a33f3dfe5', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子T组W26 vs W27
Beach Volleyball W', '小组赛', 1777168800000, 1777172100000, FALSE, NULL, NULL),
('6e2d979f-a996-5323-98b3-9d8b61d8099d', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子A组M2 vs M3
Beach Volleyball M', '小组赛', 1777168800000, 1777172100000, FALSE, NULL, NULL),
('a2089f54-1ce4-5fd9-81ee-65b894930fa6', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子U组W30 vs W31
Beach Volleyball W', '小组赛', 1777168800000, 1777172100000, FALSE, NULL, NULL),
('2ac41be3-f1b8-5ad1-b012-9c03a579ec6c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子B组M6 vs M7
Beach Volleyball M', '小组赛', 1777168800000, 1777172100000, FALSE, NULL, NULL),
('855e398b-de10-5be6-ac93-cb6446b8a71f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子V组W34 vs W35
Beach Volleyball W', '小组赛', 1777168800000, 1777172100000, FALSE, NULL, NULL),
('1789088e-7165-524e-9026-bcd2d5929749', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子C组M10 vs M11
Beach Volleyball M', '小组赛', 1777183200000, 1777186500000, FALSE, NULL, NULL),
('a6536767-dc3f-5b91-b7f1-bd757f2a25b6', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子W组W38 vs W39
Beach Volleyball W', '小组赛', 1777183200000, 1777186500000, FALSE, NULL, NULL),
('5dbbf101-dd72-5c9d-8c02-2f5018b45495', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子D组M14 vs M15
Beach Volleyball M', '小组赛', 1777183200000, 1777186500000, FALSE, NULL, NULL),
('48a6d220-3ccb-5d13-a6ad-7d320e42e05d', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子X组W42 vs W43
Beach Volleyball W', '小组赛', 1777183200000, 1777186500000, FALSE, NULL, NULL),
('12166c22-beef-57a5-8afb-1537ce7f264e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子E组M18 vs M19
Beach Volleyball M', '小组赛', 1777183200000, 1777186500000, FALSE, NULL, NULL),
('7ead232b-e675-5845-bc28-d65b23abf41a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Y组W46 vs W47
Beach Volleyball W', '小组赛', 1777186800000, 1777190100000, FALSE, NULL, NULL),
('9d1bbce7-9c07-51c0-8d1e-9265216120c9', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子F组M22 vs M23
Beach Volleyball M', '小组赛', 1777186800000, 1777190100000, FALSE, NULL, NULL),
('47688dee-11e1-5e3a-a036-1a85e2f65b4c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Z组W50 vs W51
Beach Volleyball W', '小组赛', 1777186800000, 1777190100000, FALSE, NULL, NULL),
('470b80c6-5168-5234-a2d9-21b26013baf8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子G组M26 vs M27
Beach Volleyball M', '小组赛', 1777186800000, 1777190100000, FALSE, NULL, NULL),
('b825dcb1-6482-5d2b-abec-94aea322100f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子O组W5 vs W6
Beach Volleyball W', '小组赛', 1777186800000, 1777190100000, FALSE, NULL, NULL),
('bfaae7c7-2c5a-5388-bbb4-c645e695cb58', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子H组M30 vs M32
Beach Volleyball M', '小组赛', 1777190400000, 1777193700000, FALSE, NULL, NULL),
('208dfe55-b2aa-5fc0-a3f1-42d26e1e4d6e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子P组W9 vs W10
Beach Volleyball W', '小组赛', 1777190400000, 1777193700000, FALSE, NULL, NULL),
('ad3e7d30-aac7-533d-aade-cdd352b6c371', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子I组M34 vs M36
Beach Volleyball M', '小组赛', 1777190400000, 1777193700000, FALSE, NULL, NULL),
('9240c1ba-ae1d-5e20-9e94-af5c27e4703e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子Q组W13 vs W14
Beach Volleyball W', '小组赛', 1777190400000, 1777193700000, FALSE, NULL, NULL),
('3f14a10e-9c16-54d3-a97b-54cba9b074cc', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子J组M38 vs M40
Beach Volleyball M', '小组赛', 1777190400000, 1777193700000, FALSE, NULL, NULL),
('9c109f0d-c835-5aad-a188-2e0c7a914647', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子R组W17 vs W18
Beach Volleyball W', '小组赛', 1777194000000, 1777197300000, FALSE, NULL, NULL),
('7c5d40b4-85fa-58f7-a0a9-c41945aee576', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子K组M42 vs M44
Beach Volleyball M', '小组赛', 1777194000000, 1777197300000, FALSE, NULL, NULL),
('2886db5c-407e-5e43-b5ba-5061642bc547', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子S组W21 vs W22
Beach Volleyball W', '小组赛', 1777194000000, 1777197300000, FALSE, NULL, NULL),
('37847547-6977-5668-9b3f-3678c6f786d7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 男子L组M46 vs M48
Beach Volleyball M', '小组赛', 1777194000000, 1777197300000, FALSE, NULL, NULL),
('d1c6e7ea-d758-555a-b7f7-65b1eeeacea4', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 女子T组W25 vs W26
Beach Volleyball W', '小组赛', 1777194000000, 1777197300000, FALSE, NULL, NULL),
('dfb44acf-f748-58cc-b7b6-a61af96c0040', 'a1000000-0000-0000-0000-000000000014', '决赛阶段抽签
Draw for Final Phase', '抽签', 1777198200000, 1777200900000, FALSE, NULL, NULL),
('c3f9c379-726b-58ab-902f-36948264de0a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777248000000, 1777251300000, TRUE, NULL, NULL),
('cc5c2c32-309f-592b-b553-e69cc6b4e8ce', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777248000000, 1777251300000, TRUE, NULL, NULL),
('6e400ec9-409b-5a27-b9b2-fd25d0f97fb2', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777248000000, 1777251300000, TRUE, NULL, NULL),
('48d93e7a-452c-56d0-8a0a-57f2f3c73cea', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777248000000, 1777251300000, TRUE, NULL, NULL),
('1e2dadb2-ece3-5b36-b47f-9570605d5644', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777248000000, 1777251300000, TRUE, NULL, NULL),
('a02e48e9-349e-561f-8bf6-6d991d5d108c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777251600000, 1777254900000, TRUE, NULL, NULL),
('d9ad8584-23c5-5d66-b6c0-dc05aa54af4c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777251600000, 1777254900000, TRUE, NULL, NULL),
('37e97c30-930b-55c2-8d0f-6d5ab1d06f5d', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777251600000, 1777254900000, TRUE, NULL, NULL),
('f5674ffd-95d3-5136-adca-0609129c684e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777251600000, 1777254900000, TRUE, NULL, NULL),
('0173acec-5ca1-5c90-95e2-6680dc7963cb', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777251600000, 1777254900000, TRUE, NULL, NULL),
('6f9d7515-9e61-5a70-a4b1-a609d555e59d', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777255200000, 1777258500000, TRUE, NULL, NULL),
('f51fbad8-6be6-5c52-9f16-430f48086878', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777255200000, 1777258500000, TRUE, NULL, NULL),
('4330cd14-a224-5f3d-889e-a0e8c9e30f2a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777255200000, 1777258500000, TRUE, NULL, NULL),
('513f3374-6b17-515c-9c2a-b856816020d4', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777255200000, 1777258500000, TRUE, NULL, NULL),
('43490ef4-e16a-5ea7-8e4d-480d8c733596', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777255200000, 1777258500000, TRUE, NULL, NULL),
('7e5a8ad5-3287-5382-80b1-58399bcea55e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777273200000, 1777276500000, TRUE, NULL, NULL),
('d514c30e-9197-53e2-9f8e-be8fc99e36fc', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777273200000, 1777276500000, TRUE, NULL, NULL),
('c69724be-6441-57b7-8e70-b074a41e54b8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777273200000, 1777276500000, TRUE, NULL, NULL),
('6358d3ab-2790-51c6-ad67-36d492eef5f8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777273200000, 1777276500000, TRUE, NULL, NULL),
('cecc698d-9264-59b5-9ab6-e70e69f1d74a', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777273200000, 1777276500000, TRUE, NULL, NULL),
('1f53de01-fc14-5e67-9a10-c40a0443f35e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777276800000, 1777280100000, TRUE, NULL, NULL),
('f4a7a912-b33e-5f38-bb9a-a807bd204ea8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777276800000, 1777280100000, TRUE, NULL, NULL),
('4b7d5a33-9c76-59f6-953f-8a8699ba288d', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777276800000, 1777280100000, TRUE, NULL, NULL),
('3d0d9805-a32a-5f58-9245-8b268cd24faa', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777276800000, 1777280100000, TRUE, NULL, NULL),
('70f93cbe-2140-5d43-96a5-b41d2533bc71', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777276800000, 1777280100000, TRUE, NULL, NULL),
('a6393dce-bd54-5d5c-aaa5-551fbf7ed0fd', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777280400000, 1777283700000, TRUE, NULL, NULL),
('cf259510-bf2e-561c-b092-4f4ddacffaae', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777280400000, 1777283700000, TRUE, NULL, NULL),
('06a75521-f8d5-5d38-aa6a-b7054feb2170', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777280400000, 1777283700000, TRUE, NULL, NULL),
('b9ec1a85-aca1-5deb-af65-e1d965592336', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777280400000, 1777283700000, TRUE, NULL, NULL),
('3b98fe1d-f1ef-570d-a867-af0c115cc98f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777284000000, 1777287300000, TRUE, NULL, NULL),
('8da18a90-3ed6-51d4-9345-23a2f163fed1', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777284000000, 1777287300000, TRUE, NULL, NULL),
('c0207b17-6f24-5ecd-a0db-3a8d91c3ff15', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-32强
Beach Volleyball Final Phase - Round of 32', '决赛阶段-32强', 1777284000000, 1777287300000, TRUE, NULL, NULL),
('a3ba14c7-a50a-51a2-9c0d-ddb6247d9075', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777338000000, 1777341300000, TRUE, NULL, NULL),
('6cecce4f-6fd4-5541-b868-988a93346176', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777338000000, 1777341300000, TRUE, NULL, NULL),
('05d2c3de-122e-5c59-b58f-1540ad9321f4', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777338000000, 1777341300000, TRUE, NULL, NULL),
('f0c994ed-ddf2-56f9-a7b1-a73a046c909f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777338000000, 1777341300000, TRUE, NULL, NULL),
('f18481d0-33bf-524b-8a44-ec9292d8a472', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777341600000, 1777344900000, TRUE, NULL, NULL),
('a414cdfd-fc18-5c68-aa84-831e57d99943', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777341600000, 1777344900000, TRUE, NULL, NULL),
('5d926d5e-9c0b-5227-a8ac-f832ff7353dd', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777341600000, 1777344900000, TRUE, NULL, NULL),
('ce5da233-f264-5a1f-a635-7e624212908e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777359600000, 1777362900000, TRUE, NULL, NULL),
('7f3c3ecb-46fc-5c64-9f36-754ef531c9ca', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777359600000, 1777362900000, TRUE, NULL, NULL),
('59466bdb-04c4-5cf8-987e-c255095953e6', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777359600000, 1777362900000, TRUE, NULL, NULL),
('833d66dc-73f2-5648-ba18-bba159a35adc', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777363200000, 1777366500000, TRUE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('2188e561-9cec-5d30-8b08-058edfdd4af8', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777363200000, 1777366500000, TRUE, NULL, NULL),
('b27ca911-4c14-5c94-af02-bbd8c0ead930', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777363200000, 1777366500000, TRUE, NULL, NULL),
('77f0078a-f26e-5be9-b252-6ddb0c8d0872', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777366800000, 1777370100000, TRUE, NULL, NULL),
('2e02f4f1-9f05-5c45-bc51-a0689e079581', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777366800000, 1777370100000, TRUE, NULL, NULL),
('ed150270-0fe0-5dae-8feb-275ade001b8e', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-16强
Beach Volleyball Final Phase - Round of 16', '决赛阶段-16强', 1777366800000, 1777370100000, TRUE, NULL, NULL),
('351fcb8c-d862-58b5-81b3-b7e96ddc5b02', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777370400000, 1777373700000, TRUE, NULL, NULL),
('5d381a42-bbae-5420-aec6-e380edbcd7a2', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777370400000, 1777373700000, TRUE, NULL, NULL),
('1f368722-6e6b-5f7d-b2e7-7876ce394979', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777370400000, 1777373700000, TRUE, NULL, NULL),
('e6a6a0ba-3df0-55c4-acc6-fc82e533a0f7', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777370400000, 1777373700000, TRUE, NULL, NULL),
('5da465b5-ab3d-5a00-ace4-15b836eed4ae', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777374000000, 1777377300000, TRUE, NULL, NULL),
('f5e23b4c-362f-5914-8756-cb1d70339963', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777374000000, 1777377300000, TRUE, NULL, NULL),
('1f8fe8aa-16eb-5b81-b84f-f031812a516f', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777374000000, 1777377300000, TRUE, NULL, NULL),
('691353cd-88b1-57a4-b840-98229ac0fa88', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-8强
Beach Volleyball Final Phase - Round of 8', '决赛阶段-8强', 1777374000000, 1777377300000, TRUE, NULL, NULL),
('67e3e154-478d-5aa5-90eb-fd3dec09581b', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-四分之一决赛
Beach Volleyball Final Phase - Quarterfinals', '决赛阶段-四分之一决赛', 1777424400000, 1777427700000, TRUE, NULL, NULL),
('626c22c9-3ac4-5fb1-acd2-57d9652cbf47', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-四分之一决赛
Beach Volleyball Final Phase - Quarterfinals', '决赛阶段-四分之一决赛', 1777424400000, 1777427700000, TRUE, NULL, NULL),
('5a2e7a61-3a3b-5e3c-a2a8-0d1e679ffc8d', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-四分之一决赛
Beach Volleyball Final Phase - Quarterfinals', '决赛阶段-四分之一决赛', 1777424400000, 1777427700000, TRUE, NULL, NULL),
('1e5a4c99-2a52-53cc-a4cc-90a3879942d1', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-四分之一决赛
Beach Volleyball Final Phase - Quarterfinals', '决赛阶段-四分之一决赛', 1777424400000, 1777427700000, TRUE, NULL, NULL),
('cc741ecc-bd80-5bfe-b0ea-c0a5099fd250', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-半决赛
Beach Volleyball Final Phase - Semifinals', '决赛阶段-半决赛', 1777446000000, 1777449300000, TRUE, NULL, NULL),
('8c6370e4-c2ab-502f-87b5-edc8f5f3bc8c', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-半决赛
Beach Volleyball Final Phase - Semifinals', '决赛阶段-半决赛', 1777449600000, 1777452900000, TRUE, NULL, NULL),
('c36e41de-a478-5ddd-9ff8-33cb72ed1f65', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-决赛
Beach Volleyball Final Phase -  Finals', '决赛阶段-决赛', 1777453200000, 1777456500000, TRUE, NULL, NULL),
('9f8cc982-0edd-5f3b-b844-a9112009a8d0', 'a1000000-0000-0000-0000-000000000014', '沙滩排球 决赛阶段-决赛
Beach Volleyball Final Phase -  Finals', '决赛阶段-决赛', 1777456800000, 1777460100000, TRUE, NULL, NULL),
('5bcb412a-cfe3-5efe-b254-0af9db004318', 'a1000000-0000-0000-0000-000000000014', '颁奖仪式
Victory Ceremony', '颁奖仪式', 1777460400000, 1777463100000, FALSE, NULL, NULL),
('caac739f-7ab6-57c4-a21c-127692eaa50a', 'a1000000-0000-0000-0000-000000000014', '颁奖仪式
Victory Ceremony', '颁奖仪式', 1777460880000, 1777463580000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 沙滩摔跤 (32 events)
INSERT INTO public.events (id, venue_id, name, round, start_time, end_time, is_medal_event, broadcast_channel, notes)
VALUES
('7e9a8b67-5750-557a-b5e6-c49b6a53ddd8', 'a1000000-0000-0000-0000-000000000015', 'Men''s 70KG 男子70公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('ae113b5b-f9ed-594a-8f9f-03f859a1cca2', 'a1000000-0000-0000-0000-000000000015', 'Men''s 80KG 男子80公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('d2a140be-9fe9-55ab-9b22-0131d3ebb2ee', 'a1000000-0000-0000-0000-000000000015', 'Men''s 90KG 男子90公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('c984d059-ba85-5c43-b66d-a44edb3a670f', 'a1000000-0000-0000-0000-000000000015', 'Men''s+90KG 男子+90公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('21a40369-db4e-591f-9fc9-1f5cd0ecce40', 'a1000000-0000-0000-0000-000000000015', 'Women''s 50KG 女子50公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('237ae4ff-b2fd-5350-95af-d3839fd1a930', 'a1000000-0000-0000-0000-000000000015', 'Women''s 60KG 女子60公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('948bdec0-21f2-569f-92d3-9e5a3a6d9a76', 'a1000000-0000-0000-0000-000000000015', 'Women''s 70KG 女子70公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('9ac16a4f-5f69-5bd4-82c6-8208a7474e54', 'a1000000-0000-0000-0000-000000000015', 'Women''s +70KG 女子+70公斤', '第一轮', 1777341600000, 1777348800000, FALSE, NULL, NULL),
('17d4b073-e378-50bd-82f2-3d86a2f4c0ab', 'a1000000-0000-0000-0000-000000000015', 'Men''s 70KG 男子70公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('b6d18f2b-5dc2-551f-b275-391482e8fac2', 'a1000000-0000-0000-0000-000000000015', 'Men''s 80KG 男子80公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('4f7b215e-1d51-58ed-a725-8e4260983aae', 'a1000000-0000-0000-0000-000000000015', 'Men''s 90KG 男子90公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('3ad137cd-9977-5ca1-9b6f-7c8fbeace051', 'a1000000-0000-0000-0000-000000000015', 'Men''s+90KG 男子+90公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('0f1a04ff-334d-5b95-a97a-def296a24a37', 'a1000000-0000-0000-0000-000000000015', 'Women''s 50KG 女子50公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('c43420dd-0cc8-57f6-a216-b70e6aafc19c', 'a1000000-0000-0000-0000-000000000015', 'Women''s 60KG 女子60公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('3b0ec03a-eaf7-5329-98fc-dcdc6053ddbb', 'a1000000-0000-0000-0000-000000000015', 'Women''s 70KG 女子70公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('8d853916-10df-5cb8-991f-bbf548cc001c', 'a1000000-0000-0000-0000-000000000015', 'Women''s +70KG 女子+70公斤', '第二轮', 1777359600000, 1777366800000, FALSE, NULL, NULL),
('663f0fa2-1a9b-5943-8587-e1ba64a17023', 'a1000000-0000-0000-0000-000000000015', 'Men''s 70KG 男子70公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('75dbc1de-c5a8-5cc4-92da-d9e098e64a28', 'a1000000-0000-0000-0000-000000000015', 'Men''s 80KG 男子80公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('d7f9afe5-7f6c-5370-9e99-05b6df314abf', 'a1000000-0000-0000-0000-000000000015', 'Men''s 90KG 男子90公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('cda4717a-2190-55a1-bce3-34e9641ecad7', 'a1000000-0000-0000-0000-000000000015', 'Men''s+90KG 男子+90公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('f3198c12-ad36-525e-b8cb-48d199ffee74', 'a1000000-0000-0000-0000-000000000015', 'Women''s 50KG 女子50公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('062ab5a7-16ed-5609-8ad8-fc02a7005512', 'a1000000-0000-0000-0000-000000000015', 'Women''s 60KG 女子60公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('c1e6f15c-e28b-5f1e-87d1-404c426292df', 'a1000000-0000-0000-0000-000000000015', 'Women''s 70KG 女子70公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('ce7b164e-78cd-57a7-ace1-72199725d558', 'a1000000-0000-0000-0000-000000000015', 'Women''s +70KG 女子+70公斤', '第三轮', 1777428000000, 1777435200000, FALSE, NULL, NULL),
('1069e528-f95a-5fa0-b4d2-417ef49c2a3c', 'a1000000-0000-0000-0000-000000000015', 'Men''s 70KG 男子70公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL),
('55383c02-92dd-5cd2-970e-8fccca94acfa', 'a1000000-0000-0000-0000-000000000015', 'Men''s 80KG 男子80公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL),
('d24bb9b4-a828-5a5b-bf1e-5d6c801c9b4f', 'a1000000-0000-0000-0000-000000000015', 'Men''s 90KG 男子90公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL),
('be7180d5-2144-50d0-96a9-d51441844498', 'a1000000-0000-0000-0000-000000000015', 'Men''s+90KG 男子+90公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL),
('1732a5e3-b373-5d77-9f25-d9abd53e2c20', 'a1000000-0000-0000-0000-000000000015', 'Women''s 50KG 女子50公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL),
('a4396441-19c3-5e63-9b52-33f9d629003b', 'a1000000-0000-0000-0000-000000000015', 'Women''s 60KG 女子60公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL),
('c3665ab4-17eb-5401-8fa6-1e58deabd395', 'a1000000-0000-0000-0000-000000000015', 'Women''s 70KG 女子70公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL),
('1a489129-a594-5b1d-991c-af68146a4827', 'a1000000-0000-0000-0000-000000000015', 'Women''s +70KG 女子+70公斤', '淘汰赛', 1777446000000, 1777456800000, FALSE, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SUMMARY: 559 events across 15 venues
-- ============================================================
-- 公开水域游泳: 3 events
-- 水球: 27 events
-- 三人篮球: 74 events
-- 沙滩田径: 35 events
-- 龙舟: 10 events
-- 沙滩足球: 10 events
-- 沙滩手球: 44 events
-- 柔术: 12 events
-- 沙滩卡巴迪: 34 events
-- 帆船: 14 events
-- 攀岩: 6 events
-- 台克球: 32 events
-- 游跑两项: 3 events
-- 沙滩排球: 223 events
-- 沙滩摔跤: 32 events
-- TOTAL: 559 events
