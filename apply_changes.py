#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Apply comparison results to Supabase using saved JSON.
- PATCH 122 changed events (update start_time/end_time)
- POST 29 new events (insert)
"""

import requests
import json
import re
from datetime import datetime, timedelta
import warnings
warnings.filterwarnings('ignore')

SUPABASE_URL = 'https://mdgfcgxtlxgzkvoiqonp.supabase.co/rest/v1'
ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kZ2ZjZ3h0bHhnemt2b2lxb25wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM1NTcwMjIsImV4cCI6MjA4OTEzMzAyMn0.ds9Ab_HkRNsUDSUrTlfJ5NpmlywgWwotNei4YX3Oo-k'
SERVICE_KEY = 'sb_secret_LGFZ6XFx1Ri20x6bufWkIQ_wH-1IRK0'

READ_HEADERS = {
    'apikey': ANON_KEY,
    'Authorization': f'Bearer {ANON_KEY}',
}
WRITE_HEADERS = {
    'apikey': ANON_KEY,
    'Authorization': f'Bearer {ANON_KEY}',
    'Content-Type': 'application/json',
    'Prefer': 'return=minimal',
}

# ── helpers ──────────────────────────────────────────────────────────────────

def time_to_minutes(t):
    if not t:
        return None
    try:
        h, m = map(int, str(t).strip().split(':')[:2])
        return h * 60 + m
    except:
        return None

def parse_iso_time(val):
    if val is None:
        return None
    if isinstance(val, (int, float)):
        dt = datetime.utcfromtimestamp(val / 1000) + timedelta(hours=8)
        return dt.strftime('%H:%M')
    s = str(val)
    m = re.search(r'T(\d{2}:\d{2})', s)
    return m.group(1) if m else None

def parse_iso_date(val):
    if val is None:
        return None
    if isinstance(val, (int, float)):
        dt = datetime.utcfromtimestamp(val / 1000) + timedelta(hours=8)
        return dt.strftime('%Y-%m-%d')
    s = str(val)
    m = re.search(r'(\d{4}-\d{2}-\d{2})', s)
    return m.group(1) if m else None

def hhmm_to_unix_ms(date_str, time_str):
    """'YYYY-MM-DD' + 'H:MM' or 'HH:MM' → Unix ms in UTC (subtracting 8h)."""
    if not date_str or not time_str:
        return None
    try:
        t = time_str.strip()
        # pad single-digit hours
        if re.match(r'^\d:\d{2}$', t):
            t = '0' + t
        dt_local = datetime.strptime(f"{date_str} {t}", '%Y-%m-%d %H:%M')
        dt_utc = dt_local - timedelta(hours=8)
        return int(dt_utc.timestamp() * 1000)
    except Exception as e:
        print(f"  [WARN] hhmm_to_unix_ms({date_str}, {time_str}): {e}")
        return None

def normalize_name(s):
    if not s:
        return ''
    chinese = re.findall(r'[\u4e00-\u9fff]+', str(s))
    if chinese:
        return ''.join(chinese)
    return re.sub(r'[^\w]', '', str(s).lower())

def name_similarity(a, b):
    a, b = normalize_name(a), normalize_name(b)
    if not a or not b:
        return 0.0
    if a == b:
        return 1.0
    sa, sb = set(a), set(b)
    inter = len(sa & sb)
    union = len(sa | sb)
    return inter / union if union else 0.0

# ── fetch DB ─────────────────────────────────────────────────────────────────

def fetch_db():
    venues_r = requests.get(f'{SUPABASE_URL}/venues?select=*', headers=READ_HEADERS)
    venues = venues_r.json()

    all_events = []
    offset = 0
    while True:
        r = requests.get(
            f'{SUPABASE_URL}/events?select=*&limit=1000&offset={offset}',
            headers=READ_HEADERS
        )
        batch = r.json()
        if not batch:
            break
        all_events.extend(batch)
        if len(batch) < 1000:
            break
        offset += 1000

    print(f"  DB: {len(venues)} venues, {len(all_events)} events")
    return venues, all_events

# ── recompute diff from saved JSON ───────────────────────────────────────────

def rerun_comparison(excel_events, db_venues, db_events):
    venue_by_name = {v['name']: v['id'] for v in db_venues}

    def find_venue_id(sport_name):
        if sport_name in venue_by_name:
            return venue_by_name[sport_name]
        if sport_name + '赛场' in venue_by_name:
            return venue_by_name[sport_name + '赛场']
        for vn, vid in venue_by_name.items():
            if sport_name in vn or vn in sport_name:
                return vid
        return None

    db_by_venue = {}
    for e in db_events:
        vid = e.get('venue_id')
        db_by_venue.setdefault(vid, []).append(e)

    matched_db_ids = set()
    changed_pairs = []
    new_events = []

    for ex in excel_events:
        venue_name = ex['venue']
        venue_id   = find_venue_id(venue_name)
        ex_date    = ex['date']
        ex_start   = ex['start_time']
        ex_end     = ex['end_time']
        ex_name    = ex['event_name']

        if not venue_id:
            new_events.append({**ex, 'venue_id': None})
            continue

        candidates = db_by_venue.get(venue_id, [])
        best_match = None
        best_score = 0

        for db_e in candidates:
            db_date  = parse_iso_date(db_e.get('start_time'))
            db_start = parse_iso_time(db_e.get('start_time'))
            db_name  = db_e.get('name', '')

            if db_date != ex_date:
                continue

            ex_min = time_to_minutes(ex_start)
            db_min = time_to_minutes(db_start)
            if ex_min is not None and db_min is not None:
                diff = abs(ex_min - db_min)
                if diff > 120:
                    continue
                time_score = max(0, 1 - diff / 120)
            else:
                time_score = 0.3

            ns = name_similarity(ex_name, db_name)
            score = ns * 0.7 + time_score * 0.3

            if score > best_score:
                best_score = score
                best_match = db_e

        if best_match and best_score > 0.2:
            matched_db_ids.add(best_match['id'])
            db_start = parse_iso_time(best_match.get('start_time'))
            ex_min = time_to_minutes(ex_start)
            db_min = time_to_minutes(db_start)
            time_diff = abs(ex_min - db_min) if (ex_min and db_min) else 0

            if time_diff > 5:
                changed_pairs.append({
                    'db_id':      best_match['id'],
                    'db_name':    best_match.get('name', ''),
                    'date':       ex_date,
                    'new_start':  ex_start,
                    'new_end':    ex_end,
                    'venue':      venue_name,
                    'excel_name': ex_name,
                })
        else:
            new_events.append({**ex, 'venue_id': venue_id})

    return changed_pairs, new_events

# ── apply updates ─────────────────────────────────────────────────────────────

def apply_updates(changed_pairs):
    ok, fail = 0, []
    total = len(changed_pairs)
    print(f"\nApplying {total} PATCH updates...")

    for i, item in enumerate(changed_pairs, 1):
        db_id        = item['db_id']
        date         = item['date']
        new_start_ms = hhmm_to_unix_ms(date, item['new_start'])
        new_end_ms   = hhmm_to_unix_ms(date, item['new_end']) if item.get('new_end') else None

        if new_start_ms is None:
            fail.append({'id': db_id, 'reason': f"bad start: {item['new_start']}"})
            continue

        payload = {'start_time': new_start_ms}
        if new_end_ms is not None:
            payload['end_time'] = new_end_ms

        url = f"{SUPABASE_URL}/events?id=eq.{db_id}"
        r = requests.patch(url, headers=WRITE_HEADERS, json=payload)

        if r.status_code in (200, 204):
            ok += 1
            if i % 20 == 0 or i == total:
                print(f"  [{i:3d}/{total}] OK   {item['venue']} {date} {item['excel_name'][:45]}")
        else:
            fail.append({
                'id':     db_id,
                'venue':  item['venue'],
                'event':  item['excel_name'],
                'status': r.status_code,
                'body':   r.text[:300],
            })
            print(f"  [{i:3d}/{total}] FAIL {r.status_code} — {item['venue']} {item['excel_name'][:40]}")
            print(f"         {r.text[:200]}")

    return ok, fail

# ── apply inserts ─────────────────────────────────────────────────────────────

def apply_inserts(new_events, db_venues):
    venue_by_name = {v['name']: v['id'] for v in db_venues}

    def find_venue_id(sport_name):
        if sport_name in venue_by_name:
            return venue_by_name[sport_name]
        if sport_name + '赛场' in venue_by_name:
            return venue_by_name[sport_name + '赛场']
        for vn, vid in venue_by_name.items():
            if sport_name in vn or vn in sport_name:
                return vid
        return None

    ok, fail = 0, []
    total = len(new_events)
    print(f"\nApplying {total} POST inserts...")

    for i, ex in enumerate(new_events, 1):
        vid = ex.get('venue_id') or find_venue_id(ex['venue'])
        if not vid:
            fail.append({'event': ex['event_name'], 'reason': f"venue not found: {ex['venue']}"})
            print(f"  [{i:2d}/{total}] FAIL no venue — {ex['venue']} {ex['event_name'][:40]}")
            continue

        start_ms = hhmm_to_unix_ms(ex['date'], ex['start_time'])
        end_ms   = hhmm_to_unix_ms(ex['date'], ex['end_time']) if ex.get('end_time') else None

        if start_ms is None:
            fail.append({'event': ex['event_name'], 'reason': f"bad start: {ex['start_time']}"})
            continue

        payload = {
            'venue_id':       vid,
            'name':           ex['event_name'],
            'round':          ex.get('phase', '') or '',
            'is_medal_event': bool(ex.get('is_medal_event', False)),
            'start_time':     start_ms,
            'status':         'scheduled',
            'is_imported':    True,
            'import_source':  'excel_20260316',
        }
        if end_ms is not None:
            payload['end_time'] = end_ms

        r = requests.post(f"{SUPABASE_URL}/events", headers=WRITE_HEADERS, json=payload)

        if r.status_code in (200, 201):
            ok += 1
            print(f"  [{i:2d}/{total}] OK   {ex['venue']} {ex['date']} {ex['event_name'][:45]}")
        else:
            fail.append({
                'event':  ex['event_name'],
                'venue':  ex['venue'],
                'date':   ex['date'],
                'status': r.status_code,
                'body':   r.text[:300],
            })
            print(f"  [{i:2d}/{total}] FAIL {r.status_code} — {ex['venue']} {ex['event_name'][:40]}")
            print(f"         {r.text[:300]}")

    return ok, fail

# ── main ─────────────────────────────────────────────────────────────────────

if __name__ == '__main__':
    print("=" * 60)
    print("Step 1: Load saved Excel parse results")
    print("=" * 60)
    with open('/Users/romandemac/Desktop/Asian Beach APP/excel_events_parsed.json', encoding='utf-8') as f:
        saved = json.load(f)
    excel_events = saved['excel_events']
    print(f"  Loaded {len(excel_events)} Excel events from JSON")

    print("\n" + "=" * 60)
    print("Step 2: Fetch DB")
    print("=" * 60)
    db_venues, db_events = fetch_db()

    print("\n" + "=" * 60)
    print("Step 3: Recompute diff")
    print("=" * 60)
    changed_pairs, new_events = rerun_comparison(excel_events, db_venues, db_events)
    print(f"  変更: {len(changed_pairs)}  新増: {len(new_events)}")

    print("\n" + "=" * 60)
    print("Step 4: PATCH changed events")
    print("=" * 60)
    upd_ok, upd_fail = apply_updates(changed_pairs)

    print("\n" + "=" * 60)
    print("Step 5: POST new events")
    print("=" * 60)
    ins_ok, ins_fail = apply_inserts(new_events, db_venues)

    print("\n" + "=" * 60)
    print("FINAL REPORT")
    print("=" * 60)
    print(f"  Updates:  {upd_ok} succeeded / {len(changed_pairs)} total  ({len(upd_fail)} failed)")
    print(f"  Inserts:  {ins_ok} succeeded / {len(new_events)} total  ({len(ins_fail)} failed)")

    if upd_fail:
        print("\nFailed UPDATES:")
        for f in upd_fail:
            print(f"  {f}")

    if ins_fail:
        print("\nFailed INSERTS:")
        for f in ins_fail:
            print(f"  {f}")

    result = {
        'updates_ok':   upd_ok,
        'updates_fail': upd_fail,
        'inserts_ok':   ins_ok,
        'inserts_fail': ins_fail,
    }
    with open('/Users/romandemac/Desktop/Asian Beach APP/apply_changes_result.json', 'w', encoding='utf-8') as f:
        json.dump(result, f, ensure_ascii=False, indent=2)
    print("\nLog saved to: apply_changes_result.json")
