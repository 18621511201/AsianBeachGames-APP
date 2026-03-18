#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Parse competition schedule Excel and compare with Supabase DB.
"""

import pandas as pd
import requests
import json
import re
from datetime import datetime, timedelta, time
import warnings
warnings.filterwarnings('ignore')

EXCEL_PATH = '/Users/romandemac/Library/Containers/com.tencent.xinWeChat/Data/Documents/xwechat_files/romanling_b176/temp/drag/01汇总-竞赛单元日程0316(1).xlsx'
SUPABASE_URL = 'https://mdgfcgxtlxgzkvoiqonp.supabase.co/rest/v1'
API_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kZ2ZjZ3h0bHhnemt2b2lxb25wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM1NTcwMjIsImV4cCI6MjA4OTEzMzAyMn0.ds9Ab_HkRNsUDSUrTlfJ5NpmlywgWwotNei4YX3Oo-k'
HEADERS = {'apikey': API_KEY, 'Authorization': f'Bearer {API_KEY}'}

# Sheet name → DB venue name
SHEET_VENUE_MAP = {
    '公开水域游泳 Open Water Swimming': '公开水域游泳',
    '水球 Water Polo': '水球',
    '三人篮球 3x3 Basketball': '三人篮球',
    '沙滩田径 Beach Athletics': '沙滩田径',
    '龙舟 Dragon Boat': '龙舟',
    '沙滩足球 Beach Football': '沙滩足球',
    '沙滩手球 Beach Handball': '沙滩手球',
    '柔术 Jiu Jitsu': '柔术',
    '沙滩卡巴迪 Beach Kabaddi': '沙滩卡巴迪',
    '帆船 Sailing': '帆船',
    '攀岩 Sport Climbing': '攀岩',
    '台克球 Teqball': '台克球',
    '游跑两项 Aquathlon': '游跑两项',
    '沙滩排球 Beach Volleyball': '沙滩排球',
    '沙滩摔跤 Beach Wrestling': '沙滩摔跤',
}

SKIP_KEYWORDS = [
    'victory ceremony', '颁奖仪式', 'award ceremony', 'opening ceremony',
    '颁奖', '训练', 'technical meeting', 'equipment', 'athlete registration',
    'practice races', 'warm-up', 'reserve day', 'end of session', 'break',
    'rest day', 'rest\nday', '休息日', 'awarding ceremony', 'opening',
    'confirmation of attendance', '报到确认', 'warm-up area open', '热身区开放',
    'official training', '官方训练', 'technical officials', '技术官员',
    'equipment draw', '器材抽签', 'athlete registration', '运动员报到',
    'equipment inspection', '器材检查', 'team manager', '领队',
    'opening ceremony', '开赛仪式',
]

def should_skip(name):
    if pd.isna(name):
        return True
    name_lower = str(name).lower()
    for kw in SKIP_KEYWORDS:
        if kw.lower() in name_lower:
            return True
    return False

def parse_date(val):
    """Normalize a date value to YYYY-MM-DD string."""
    if pd.isna(val):
        return None
    s = str(val).strip()
    # Excel artifact 1900-03-06
    if '1900' in s:
        return None
    # Range like "2026/4/23-4/27"
    if '-' in s and '/' in s:
        # Take the first date of the range
        parts = s.split('-')
        first = parts[0].strip()
        try:
            dt = pd.to_datetime(first)
            return dt.strftime('%Y-%m-%d')
        except:
            pass
    # "2026/4/25\n" or "2026/4/25 \n"
    s = s.split('\n')[0].strip()
    # Try pandas
    try:
        dt = pd.to_datetime(s)
        if dt.year == 1900:
            return None
        return dt.strftime('%Y-%m-%d')
    except:
        return None

def parse_time_range(val):
    """Returns (start_str, end_str) or (start_str, None)."""
    if pd.isna(val):
        return None, None
    s = str(val).strip()
    # Handle "1900-03-06 16:00:00" artifact
    if '1900' in s:
        # Extract time part
        m = re.search(r'(\d{1,2}:\d{2}(?::\d{2})?)', s)
        if m:
            t = m.group(1)[:5]
            return t, None
        return None, None
    # "All Day" or similar
    if 'all day' in s.lower() or 'all\nday' in s.lower():
        return '09:00', '17:00'
    # Normalize: remove trailing .000 etc from times like "15:29:59.971000"
    # Also handle "HH:MM:SS.ffffff"
    s = re.sub(r'(\d{2}:\d{2}):\d{2}(?:\.\d+)?', r'\1', s)
    # Range "HH:MM-HH:MM"
    m = re.match(r'(\d{1,2}:\d{2})\s*[-–]\s*(\d{1,2}:\d{2})', s)
    if m:
        return m.group(1), m.group(2)
    # Single "HH:MM"
    m = re.match(r'^(\d{1,2}:\d{2})$', s)
    if m:
        return m.group(1), None
    # Pandas Timestamp
    try:
        ts = pd.to_datetime(s)
        if ts.year == 1900:
            return ts.strftime('%H:%M'), None
        return ts.strftime('%H:%M'), None
    except:
        pass
    return None, None

def build_iso(date_str, time_str):
    """Build ISO 8601 timestamp with +08:00."""
    if not date_str or not time_str:
        return None
    try:
        return f"{date_str}T{time_str}:00+08:00"
    except:
        return None

def cn_part(text):
    """Extract Chinese part (after \\n) or return full text."""
    if pd.isna(text):
        return ''
    s = str(text)
    if '\n' in s:
        parts = s.split('\n')
        # Take last non-empty part that has Chinese characters
        for p in reversed(parts):
            p = p.strip()
            if p and re.search(r'[\u4e00-\u9fff]', p):
                return p
        # Fallback: last part
        return parts[-1].strip()
    return s.strip()

def is_medal_event(phase_str):
    s = str(phase_str).lower()
    if ('决赛' in s or 'final' in s):
        if '半决赛' not in s and 'semi' not in s:
            return True
    return False

def estimate_end(start_str, duration_min=45):
    """Estimate end time from start + duration."""
    if not start_str:
        return None
    try:
        h, m = map(int, start_str.split(':'))
        total = h * 60 + m + duration_min
        return f"{total//60:02d}:{total%60:02d}"
    except:
        return None

# ============================================================
# Sheet Parsers
# ============================================================

def parse_standard(df, venue):
    """Parse standard 4-col sheets: Date, Time, Event, Phase."""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue  # header row
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        event_val = row.iloc[2]
        phase_val = row.iloc[3] if len(row) > 3 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if should_skip(event_val):
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue

        if not end:
            end = estimate_end(start)

        event_name = cn_part(event_val)
        phase = cn_part(phase_val)

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': phase,
            'is_medal_event': is_medal_event(phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_shuiqiu(df, venue):
    """水球: Date, Time, Category, Game No, Field No, Teams, Phase"""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        category_val = row.iloc[2]
        game_no = row.iloc[3]
        teams_val = row.iloc[5]
        phase_val = row.iloc[6] if len(row) > 6 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if should_skip(category_val):
            continue
        if pd.isna(time_val):
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue
        if not end:
            end = estimate_end(start, 45)

        cat = cn_part(category_val)
        gno = str(game_no).strip() if not pd.isna(game_no) else ''
        teams = str(teams_val).strip() if not pd.isna(teams_val) else ''
        event_name = f"{cat} 第{gno}场 {teams}"
        phase = cn_part(phase_val)

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': phase,
            'is_medal_event': is_medal_event(phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_sanrenlanqiu(df, venue):
    """三人篮球: Date, Time, Category(W/M), Group, Game No, Court, Teams, Phase"""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        cat_val = row.iloc[2]
        group_val = row.iloc[3]
        game_no = row.iloc[4]
        teams_val = row.iloc[6]
        phase_val = row.iloc[7] if len(row) > 7 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if should_skip(cat_val) or pd.isna(cat_val):
            continue
        if pd.isna(time_val):
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue
        if not end:
            end = estimate_end(start, 25)

        cat = str(cat_val).strip()
        cat_cn = '女子' if cat == 'W' else ('男子' if cat == 'M' else cat)
        grp = str(group_val).strip() if not pd.isna(group_val) else ''
        gno = str(int(float(game_no))).strip() if not pd.isna(game_no) else ''
        teams = str(teams_val).strip() if not pd.isna(teams_val) else ''
        phase = cn_part(phase_val)
        event_name = f"{cat_cn} {grp}组 第{gno}场 {teams}"

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': phase,
            'is_medal_event': is_medal_event(phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_shatan_zuqiu(df, venue):
    """沙滩足球: Date, Time, Category, Game No, Group, Court, Teams1, (blank), Phase"""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        cat_val = row.iloc[2]
        game_no = row.iloc[3]
        group_val = row.iloc[4]
        teams1 = row.iloc[6]
        teams2 = row.iloc[7] if len(row) > 7 else ''
        phase_val = row.iloc[8] if len(row) > 8 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if should_skip(cat_val) or pd.isna(cat_val):
            continue
        if pd.isna(time_val):
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue
        if not end:
            end = estimate_end(start, 90)

        cat = cn_part(str(cat_val))
        # "M/男" → "男子"
        if 'M' in str(cat_val):
            cat = '男子'
        elif 'W' in str(cat_val):
            cat = '女子'
        grp = str(group_val).strip() if not pd.isna(group_val) else ''
        gno = str(int(float(game_no))).strip() if not pd.isna(game_no) else ''
        t1 = str(teams1).strip() if not pd.isna(teams1) else ''
        t2 = str(teams2).strip() if not pd.isna(teams2) else ''
        phase = cn_part(phase_val)
        event_name = f"{cat} {grp}组 第{gno}场 {t1} vs {t2}"

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': phase,
            'is_medal_event': is_medal_event(phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_shatan_shoujiu(df, venue):
    """沙滩手球: Date, Start Time, Finish Time, Event Name, Venue, Gender, Category"""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        start_val = row.iloc[1]
        end_val = row.iloc[2]
        event_val = row.iloc[3]
        gender_val = row.iloc[5] if len(row) > 5 else ''
        cat_val = row.iloc[6] if len(row) > 6 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        # Skip REST DAY
        if not pd.isna(date_val) and 'rest' in str(date_val).lower():
            continue
        if not pd.isna(event_val) and should_skip(event_val):
            continue

        # Skip TBD
        if pd.isna(start_val) or 'tbd' in str(start_val).lower():
            continue

        start, _ = parse_time_range(start_val)
        end, _ = parse_time_range(end_val)
        if not start:
            continue

        event_name = cn_part(event_val)
        if not event_name:
            continue
        cat = cn_part(cat_val)

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': cat,
            'is_medal_event': is_medal_event(cat),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_kabaddi(df, venue):
    """沙滩卡巴迪: Date, Time, Category(M/W), Game No, Court No, Teams"""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        cat_val = row.iloc[2]
        game_no = row.iloc[3]
        court_val = row.iloc[4]
        teams_val = row.iloc[5]

        d = parse_date(date_val)
        if d:
            current_date = d

        if pd.isna(cat_val):
            continue
        if should_skip(cat_val):
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue
        if not end:
            end = estimate_end(start, 40)

        cat = str(cat_val).strip()
        cat_cn = '男子' if cat == 'M' else ('女子' if cat == 'W' else cat)
        gno = str(int(float(game_no))).strip() if not pd.isna(game_no) else ''
        court = str(int(float(court_val))).strip() if not pd.isna(court_val) else ''
        teams = str(teams_val).strip() if not pd.isna(teams_val) else ''
        event_name = f"{cat_cn} 第{gno}场 场地{court} {teams}"

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': '',
            'is_medal_event': False,
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_fanjian(df, venue):
    """帆船: skip non-competition rows, keep competition rows."""
    events = []
    SAILING_SKIP = [
        'equipment draw', 'athlete registration', 'equipment inspection',
        'technical officials', 'team manager', 'practice races',
        'open training', '器材抽签', '运动员报到', '器材检查', '技术会议',
        '领队', '练习赛', '公开训练', 'victory ceremony', '颁奖仪式',
        'technical meeting',
    ]

    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        event_val = row.iloc[2]
        field_val = row.iloc[3] if len(row) > 3 else ''
        phase_val = row.iloc[4] if len(row) > 4 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if pd.isna(event_val):
            continue
        name_lower = str(event_val).lower()
        skip = False
        for kw in SAILING_SKIP:
            if kw.lower() in name_lower:
                skip = True
                break
        if skip:
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue
        if not end:
            end = estimate_end(start, 360)  # sailing races ~6h

        event_name = cn_part(event_val)
        phase = cn_part(phase_val)

        # For date range like "2026/4/23-4/27", expand to each day
        date_s = str(date_val).strip()
        if '-' in date_s and '/' in date_s and '4/' in date_s:
            # Parse range
            m = re.search(r'(\d{4})/(\d+)/(\d+)-(\d+)/(\d+)', date_s)
            if m:
                y, m1, d1, m2, d2 = int(m.group(1)), int(m.group(2)), int(m.group(3)), int(m.group(4)), int(m.group(5))
                start_d = datetime(y, m1, d1)
                end_d = datetime(y, m2, d2)
                cur = start_d
                while cur <= end_d:
                    dstr = cur.strftime('%Y-%m-%d')
                    events.append({
                        'venue': venue,
                        'date': dstr,
                        'start_time': start,
                        'end_time': end,
                        'event_name': event_name,
                        'phase': phase,
                        'is_medal_event': False,
                        'start_iso': build_iso(dstr, start),
                        'end_iso': build_iso(dstr, end),
                    })
                    cur += timedelta(days=1)
                continue

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': phase,
            'is_medal_event': is_medal_event(phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_panyuan(df, venue):
    """攀岩: skip warm-up/training/reserve/ceremony, keep competition events."""
    CLIMBING_SKIP = [
        'warm-up', '热身', 'official training', '官方训练', 'reserve day', '备用日',
        'awarding ceremony', '颁奖仪式', 'victory ceremony', 'confirmation of attendance',
        '报到确认', 'technical meeting', '技术会议',
    ]
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        event_val = row.iloc[2]
        phase_val = row.iloc[3] if len(row) > 3 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if pd.isna(event_val):
            continue
        name_lower = str(event_val).lower()
        skip = False
        for kw in CLIMBING_SKIP:
            if kw.lower() in name_lower:
                skip = True
                break
        if skip:
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue
        if not end:
            end = estimate_end(start, 60)

        event_name = cn_part(event_val)
        phase = cn_part(phase_val)

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': phase,
            'is_medal_event': is_medal_event(phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_taikequiu(df, venue):
    """台克球: Date, Start, End, Table1, Table2, Table3, Table4"""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        start_val = row.iloc[1]
        end_val = row.iloc[2]

        d = parse_date(date_val)
        if d:
            current_date = d

        # Skip sub-header rows like "Start End Table 1球桌1"
        if pd.isna(start_val) or str(start_val).strip().lower() in ['start', '开始时间']:
            continue

        start, _ = parse_time_range(start_val)
        end, _ = parse_time_range(end_val)
        if not start:
            continue

        # Process each table column (3-6)
        for col_idx in range(3, min(7, len(row))):
            cell = row.iloc[col_idx]
            if pd.isna(cell) or str(cell).strip() == '' or str(cell).strip().lower().startswith('table'):
                continue
            event_name = cn_part(cell)
            if not event_name:
                continue
            if should_skip(event_name):
                continue

            # Extract phase from event_name
            phase = ''
            if '\n' in str(cell):
                parts = str(cell).split('\n')
                # Middle part might be phase like "QF", "SF", "F"
                if len(parts) >= 2:
                    phase = parts[1].strip()

            table_no = col_idx - 2  # 1-based
            full_name = f"{event_name} 球桌{table_no}"

            events.append({
                'venue': venue,
                'date': current_date,
                'start_time': start,
                'end_time': end,
                'event_name': full_name,
                'phase': phase,
                'is_medal_event': is_medal_event(phase),
                'start_iso': build_iso(current_date, start),
                'end_iso': build_iso(current_date, end),
            })
    return events

def parse_longzhou(df, venue):
    """龙舟: Date, Time, Event, Phase. Time may be NaN for 2nd event in same block."""
    events = []
    current_date = None
    current_start = None
    current_end = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        event_val = row.iloc[2]
        phase_val = row.iloc[3] if len(row) > 3 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if should_skip(event_val):
            continue
        if pd.isna(event_val):
            continue

        start, end = parse_time_range(time_val)
        if start:
            current_start = start
            current_end = end
        else:
            # Use previous time block
            start = current_start
            end = current_end

        if not start:
            continue
        if not end:
            end = estimate_end(start, 90)

        event_name = cn_part(event_val)
        phase = cn_part(phase_val)

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': phase,
            'is_medal_event': is_medal_event(phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_roushu(df, venue):
    """柔术: Date, Time(range), Event, Phase. Multiple events per time block."""
    events = []
    current_date = None
    current_start = None
    current_end = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        event_val = row.iloc[2]
        phase_val = row.iloc[3] if len(row) > 3 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if should_skip(event_val):
            continue
        if pd.isna(event_val):
            continue

        start, end = parse_time_range(time_val)
        if start:
            current_start = start
            current_end = end
        else:
            start = current_start
            end = current_end

        if not start:
            continue
        if not end:
            end = estimate_end(start, 300)

        event_name = cn_part(event_val)
        # phase: forward-fill
        p = cn_part(phase_val)
        if p:
            current_phase = p
        else:
            current_phase = getattr(parse_roushu, '_last_phase', '')
        parse_roushu._last_phase = current_phase

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': current_phase,
            'is_medal_event': is_medal_event(current_phase),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

def parse_shatan_paiqiu(df, venue):
    """沙滩排球: Date, Time, Court1-5, Phase"""
    events = []
    current_date = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]

        d = parse_date(date_val)
        if d:
            current_date = d

        # Skip break rows
        tv = str(time_val).strip().lower()
        if 'break' in tv or 'nan' == tv or not time_val or pd.isna(time_val):
            continue

        start, end = parse_time_range(time_val)
        if not start:
            continue
        if not end:
            end = estimate_end(start, 50)

        # Each court column (2-6, indices)
        for col_idx in range(2, min(7, len(row))):
            cell = row.iloc[col_idx]
            if pd.isna(cell) or str(cell).strip() == '':
                continue
            event_name = cn_part(cell)
            if not event_name:
                continue
            if should_skip(event_name):
                continue

            court_no = col_idx - 1  # 1-based
            full_name = f"{event_name} 场地{court_no}"

            # Determine phase from event code
            phase = ''
            code = str(cell).split('\n')[0].strip()
            if 'PP' in code:
                phase = '小组赛'
            elif 'R24' in code or 'R16' in code:
                phase = '淘汰赛'
            elif 'QF' in code:
                phase = '四分之一决赛'
            elif 'SF' in code:
                phase = '半决赛'
            elif 'F1' in code:
                phase = '决赛'
            elif 'F3' in code:
                phase = '铜牌赛'

            events.append({
                'venue': venue,
                'date': current_date,
                'start_time': start,
                'end_time': end,
                'event_name': full_name,
                'phase': phase,
                'is_medal_event': is_medal_event(phase),
                'start_iso': build_iso(current_date, start),
                'end_iso': build_iso(current_date, end),
            })
    return events

def parse_shatan_shuaijiao(df, venue):
    """沙滩摔跤: Date, Time, Event(weight class), Phase. Multiple weight classes per time block."""
    events = []
    current_date = None
    current_start = None
    current_end = None
    current_phase = None
    for i, row in df.iterrows():
        if i == 0:
            continue
        date_val = row.iloc[0]
        time_val = row.iloc[1]
        event_val = row.iloc[2]
        phase_val = row.iloc[3] if len(row) > 3 else ''

        d = parse_date(date_val)
        if d:
            current_date = d

        if pd.isna(event_val):
            continue
        if should_skip(event_val):
            continue

        start, end = parse_time_range(time_val)
        if start:
            current_start = start
            current_end = end
        else:
            start = current_start
            end = current_end

        p = cn_part(phase_val)
        if p:
            current_phase = p

        if not start:
            continue
        if not end:
            end = estimate_end(start, 120)

        event_name = cn_part(event_val)

        events.append({
            'venue': venue,
            'date': current_date,
            'start_time': start,
            'end_time': end,
            'event_name': event_name,
            'phase': current_phase or '',
            'is_medal_event': is_medal_event(current_phase or ''),
            'start_iso': build_iso(current_date, start),
            'end_iso': build_iso(current_date, end),
        })
    return events

# ============================================================
# Main parsing
# ============================================================

def parse_all_excel():
    xl = pd.ExcelFile(EXCEL_PATH)
    all_events = []

    parsers = {
        '公开水域游泳 Open Water Swimming': lambda df, v: parse_standard(df, v),
        '水球 Water Polo': lambda df, v: parse_shuiqiu(df, v),
        '三人篮球 3x3 Basketball': lambda df, v: parse_sanrenlanqiu(df, v),
        '沙滩田径 Beach Athletics': lambda df, v: parse_standard(df, v),
        '龙舟 Dragon Boat': lambda df, v: parse_longzhou(df, v),
        '沙滩足球 Beach Football': lambda df, v: parse_shatan_zuqiu(df, v),
        '沙滩手球 Beach Handball': lambda df, v: parse_shatan_shoujiu(df, v),
        '柔术 Jiu Jitsu': lambda df, v: parse_roushu(df, v),
        '沙滩卡巴迪 Beach Kabaddi': lambda df, v: parse_kabaddi(df, v),
        '帆船 Sailing': lambda df, v: parse_fanjian(df, v),
        '攀岩 Sport Climbing': lambda df, v: parse_panyuan(df, v),
        '台克球 Teqball': lambda df, v: parse_taikequiu(df, v),
        '游跑两项 Aquathlon': lambda df, v: parse_standard(df, v),
        '沙滩排球 Beach Volleyball': lambda df, v: parse_shatan_paiqiu(df, v),
        '沙滩摔跤 Beach Wrestling': lambda df, v: parse_shatan_shuaijiao(df, v),
    }

    for sheet_name, parser in parsers.items():
        venue = SHEET_VENUE_MAP[sheet_name]
        df = pd.read_excel(xl, sheet_name=sheet_name, header=None)
        try:
            events = parser(df, venue)
            all_events.extend(events)
            print(f"  {venue}: {len(events)} events")
        except Exception as e:
            print(f"  ERROR parsing {sheet_name}: {e}")
            import traceback
            traceback.print_exc()

    return all_events


# ============================================================
# Fetch DB
# ============================================================

def fetch_db():
    venues_resp = requests.get(f'{SUPABASE_URL}/venues?select=*', headers=HEADERS)
    venues = venues_resp.json()
    print(f"  Fetched {len(venues)} venues from DB")

    all_events = []
    offset = 0
    limit = 1000
    while True:
        events_resp = requests.get(
            f'{SUPABASE_URL}/events?select=*&limit={limit}&offset={offset}',
            headers=HEADERS
        )
        batch = events_resp.json()
        if not batch:
            break
        all_events.extend(batch)
        if len(batch) < limit:
            break
        offset += limit

    print(f"  Fetched {len(all_events)} events from DB")
    return venues, all_events


# ============================================================
# Comparison
# ============================================================

def time_to_minutes(t_str):
    """Convert "HH:MM" to minutes since midnight."""
    if not t_str:
        return None
    try:
        parts = t_str.split(':')
        return int(parts[0]) * 60 + int(parts[1])
    except:
        return None

def normalize_name(s):
    """Normalize for comparison: lowercase, strip spaces, remove special chars.
    For bilingual names, extract Chinese part if available."""
    if not s:
        return ''
    s = str(s)
    # Extract Chinese portions
    chinese_chars = re.findall(r'[\u4e00-\u9fff]+', s)
    if chinese_chars:
        return ''.join(chinese_chars)
    return re.sub(r'[^\w]', '', s.lower())

def name_similarity(a, b):
    """Simple character overlap similarity."""
    a, b = normalize_name(a), normalize_name(b)
    if not a or not b:
        return 0.0
    if a == b:
        return 1.0
    set_a, set_b = set(a), set(b)
    intersection = len(set_a & set_b)
    union = len(set_a | set_b)
    return intersection / union if union > 0 else 0.0

def parse_iso_time(val):
    """Extract HH:MM from ISO timestamp or Unix ms timestamp."""
    if val is None:
        return None
    # Unix milliseconds
    if isinstance(val, (int, float)):
        dt = datetime.utcfromtimestamp(val / 1000) + timedelta(hours=8)
        return dt.strftime('%H:%M')
    s = str(val)
    m = re.search(r'T(\d{2}:\d{2})', s)
    return m.group(1) if m else None

def parse_iso_date(val):
    """Extract YYYY-MM-DD from ISO timestamp or Unix ms timestamp."""
    if val is None:
        return None
    # Unix milliseconds
    if isinstance(val, (int, float)):
        dt = datetime.utcfromtimestamp(val / 1000) + timedelta(hours=8)
        return dt.strftime('%Y-%m-%d')
    s = str(val)
    m = re.search(r'(\d{4}-\d{2}-\d{2})', s)
    return m.group(1) if m else None


def compare(excel_events, db_venues, db_events):
    # Build venue lookup: name → id (DB names have "赛场" suffix)
    venue_by_name = {}
    for v in db_venues:
        venue_by_name[v['name']] = v['id']

    def find_venue_id(sport_name):
        # Exact match
        if sport_name in venue_by_name:
            return venue_by_name[sport_name]
        # With "赛场" suffix
        if sport_name + '赛场' in venue_by_name:
            return venue_by_name[sport_name + '赛场']
        # Partial match
        for vn, vid in venue_by_name.items():
            if sport_name in vn or vn in sport_name:
                return vid
        return None

    # Build DB event index: venue_id → list of events
    db_by_venue = {}
    for e in db_events:
        vid = e.get('venue_id')
        if vid not in db_by_venue:
            db_by_venue[vid] = []
        db_by_venue[vid].append(e)

    matched_db_ids = set()
    changed = []
    added = []
    unchanged = []

    for ex in excel_events:
        venue_name = ex['venue']
        venue_id = find_venue_id(venue_name)

        ex_date = ex['date']
        ex_start = ex['start_time']
        ex_end = ex['end_time']
        ex_name = ex['event_name']

        if not venue_id:
            added.append({**ex, 'match_type': 'no_venue'})
            continue

        candidates = db_by_venue.get(venue_id, [])

        best_match = None
        best_score = 0

        for db_e in candidates:
            db_date = parse_iso_date(db_e.get('start_time'))
            db_start = parse_iso_time(db_e.get('start_time'))
            db_name = db_e.get('name', '') or db_e.get('event_name', '') or ''

            # Date must match
            if db_date != ex_date:
                continue

            # Time proximity (within 2h = 120 min)
            ex_min = time_to_minutes(ex_start)
            db_min = time_to_minutes(db_start)
            if ex_min is not None and db_min is not None:
                time_diff = abs(ex_min - db_min)
                if time_diff > 120:
                    continue
                time_score = max(0, 1 - time_diff / 120)
            else:
                time_score = 0.3

            name_score = name_similarity(ex_name, db_name)
            score = name_score * 0.7 + time_score * 0.3

            if score > best_score:
                best_score = score
                best_match = db_e

        if best_match and best_score > 0.2:
            matched_db_ids.add(best_match['id'])
            db_start = parse_iso_time(best_match.get('start_time'))
            db_end = parse_iso_time(best_match.get('end_time'))

            ex_min = time_to_minutes(ex_start)
            db_min = time_to_minutes(db_start)
            time_diff = abs(ex_min - db_min) if (ex_min and db_min) else 0

            if time_diff > 5:
                changed.append({
                    'venue': venue_name,
                    'date': ex_date,
                    'event_name': ex_name,
                    'old_start': db_start,
                    'old_end': db_end,
                    'new_start': ex_start,
                    'new_end': ex_end,
                    'score': best_score,
                    'db_name': best_match.get('name', ''),
                })
            else:
                unchanged.append(ex_name)
        else:
            added.append(ex)

    # DB events not matched
    deleted = []
    for e in db_events:
        if e['id'] not in matched_db_ids:
            vid = e.get('venue_id')
            vname = next((v['name'] for v in db_venues if v['id'] == vid), str(vid))
            db_date = parse_iso_date(e.get('start_time'))
            db_start = parse_iso_time(e.get('start_time'))
            db_end = parse_iso_time(e.get('end_time'))
            deleted.append({
                'venue': vname,
                'date': db_date,
                'event_name': e.get('name', ''),
                'start': db_start,
                'end': db_end,
            })

    return changed, added, deleted, unchanged


# ============================================================
# Main
# ============================================================

if __name__ == '__main__':
    print("=" * 60)
    print("STEP 1: Parsing Excel...")
    print("=" * 60)
    excel_events = parse_all_excel()
    print(f"\nTotal Excel events parsed: {len(excel_events)}")

    print("\n" + "=" * 60)
    print("STEP 2: Fetching DB...")
    print("=" * 60)
    db_venues, db_events = fetch_db()

    print("\n" + "=" * 60)
    print("STEP 3: Comparing...")
    print("=" * 60)
    changed, added, deleted, unchanged = compare(excel_events, db_venues, db_events)

    print("\n" + "=" * 60)
    print("STEP 4: Report")
    print("=" * 60)

    print(f"\n=== 变更 (时间有变化) === [{len(changed)}]")
    for e in changed:
        print(f"  [{e['venue']}] {e['date']} {e['event_name']}")
        print(f"    DB名称: {e['db_name']}")
        print(f"    旧: {e['old_start']} → {e['old_end']}")
        print(f"    新: {e['new_start']} → {e['new_end']}")

    print(f"\n=== 新增 (数据库中没有) === [{len(added)}]")
    for e in added:
        print(f"  [{e['venue']}] {e['date']} {e['event_name']}  {e['start_time']} → {e['end_time']}")

    print(f"\n=== 数据库有但Excel没有 (可能已删除) === [{len(deleted)}]")
    for e in deleted:
        print(f"  [{e['venue']}] {e['date']} {e['event_name']}  {e['start']} → {e['end']}")

    print(f"\n=== 重复 (无变化) === [{len(unchanged)}]")
    # Just count, don't list all

    # Save JSON output
    import json
    output = {
        'excel_events': excel_events,
        'summary': {
            'total_excel': len(excel_events),
            'changed': len(changed),
            'added': len(added),
            'deleted': len(deleted),
            'unchanged': len(unchanged),
        }
    }
    with open('/Users/romandemac/Desktop/Asian Beach APP/excel_events_parsed.json', 'w', encoding='utf-8') as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    print(f"\nParsed events saved to: /Users/romandemac/Desktop/Asian Beach APP/excel_events_parsed.json")
