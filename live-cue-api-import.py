#!/usr/bin/env python3
"""
Import competition schedule data from Excel into Supabase via REST API.
"""

import uuid
import json
import math
import re
import requests
import pandas as pd
from datetime import datetime, timedelta, timezone, time as time_type
import pytz

# ── Supabase connection ────────────────────────────────────────────────────────
SUPABASE_URL = "https://mdgfcgxtlxgzkvoiqonp.supabase.co"
ANON_KEY = (
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"
    ".eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kZ2ZjZ3h0bHhnemt2b2lxb25wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM1NTcwMjIsImV4cCI6MjA4OTEzMzAyMn0"
    ".ds9Ab_HkRNsUDSUrTlfJ5NpmlywgWwotNei4YX3Oo-k"
)
SECRET_KEY = "sb_secret_LGFZ6XFx1Ri20x6bufWkIQ_wH-1IRK0"

HEADERS = {
    "apikey": ANON_KEY,
    "x-supabase-api-key": SECRET_KEY,
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates",
}

EXCEL_FILE = (
    "/Users/romandemac/Library/Containers/com.tencent.xinWeChat/Data/Documents/"
    "xwechat_files/romanling_b176/temp/drag/20260311竞赛单元日程(1).xlsx"
)

SHANGHAI_TZ = pytz.timezone("Asia/Shanghai")

# ── Venue map ─────────────────────────────────────────────────────────────────
VENUE_MAP = {
    "公开水域游泳": "4a147646-352e-430e-a2d6-e8e94ebf6efc",
    "水球":         "3df0915d-b392-4a5c-8bb4-eeef9a37e383",
    "三人篮球":     "8e1ff289-c09d-4ac7-8d8e-5c4b8995e43e",
    "沙滩田径":     "a1000000-0000-0000-0000-000000000004",
    "龙舟":         "168d75d7-182f-45a1-b844-6551ddf2fc28",
    "沙滩足球":     "4fb29d01-a16a-4168-ba38-e83b2b94d91a",
    "沙滩手球":     "e11756c7-5c63-4e87-8292-bc1cf2dc9e16",
    "柔术":         "91e0d0cd-3978-4124-896c-3e0c3f6b98b8",
    "沙滩卡巴迪":   "7c93d281-e16a-4072-9aba-53dfa2990eef",
    "帆船":         "b11d3e71-dd0a-49f1-8877-c3ac16a1a090",
    "攀岩":         "eb83d189-4c5b-49b6-b153-efbf771b3f46",
    "台克球":       "972d8dde-15dc-4d10-9c20-e1eee01e80ff",
    "游跑两项":     "46ec26b2-5acf-48d4-b5d0-830a4f4f0e50",
    "沙滩排球":     "c438dbde-e947-42c2-baed-ed0d9ee10ad6",
    "沙滩摔跤":     "8018d568-672c-49c8-b46b-70b72908b386",
}

# ── Medal detection ────────────────────────────────────────────────────────────
MEDAL_KEYWORDS = ["决赛", "铜牌", "金牌", "Final", "Bronze", "Gold", "3rd place", "3rd Place"]
NON_MEDAL_KEYWORDS = ["预赛", "复赛", "小组", "Preliminary", "Qualification", "Repechage",
                      "Group Stage", "Round Robin", "循环", "Round 1", "Round 2", "Round 3"]


def is_medal(text):
    if not text:
        return False
    t = str(text)
    for kw in NON_MEDAL_KEYWORDS:
        if kw in t:
            return False
    for kw in MEDAL_KEYWORDS:
        if kw in t:
            return True
    return False


def extract_round(raw):
    """Keep Chinese portion only; if none, keep original short."""
    if raw is None or (isinstance(raw, float) and math.isnan(raw)):
        return ""
    s = str(raw).strip()
    if s.lower() in ("nan", ""):
        return ""
    # Split on newline, /, \ and pick first chunk with Chinese chars
    for sep in ["\n", "/"]:
        parts = s.split(sep)
        for p in parts:
            p = p.strip()
            if any("\u4e00" <= c <= "\u9fff" for c in p):
                return p
    # No Chinese found, return first part trimmed
    return s.split("\n")[0].split("/")[0].strip()


# ── Timestamp helpers ──────────────────────────────────────────────────────────
def to_epoch_ms(dt_naive):
    aware = SHANGHAI_TZ.localize(dt_naive)
    return int(aware.timestamp() * 1000)


def parse_date(val):
    if val is None:
        return None
    if isinstance(val, datetime):
        return val.replace(tzinfo=None)
    if isinstance(val, float) and math.isnan(val):
        return None
    s = str(val).strip()
    if not s or s.lower() == "nan":
        return None
    # Multi-line cells like "2026/4/25\n4月25日" or "2026/4/18  \n18 April"
    s = s.split("\n")[0].strip()
    for fmt in ("%Y/%m/%d", "%Y-%m-%d", "%Y年%m月%d日"):
        try:
            return datetime.strptime(s, fmt)
        except ValueError:
            pass
    # "April 28" or "April 28 2026"
    for fmt in ("%B %d %Y", "%B %d"):
        try:
            d = datetime.strptime(s if "2026" in s else s + " 2026", "%B %d %Y")
            return d
        except ValueError:
            pass
    # Excel serial number float
    try:
        n = float(s)
        return datetime(1899, 12, 30) + timedelta(days=n)
    except (ValueError, TypeError):
        pass
    return None


def _parse_single_time(s):
    s = str(s).strip()
    # Replace fullwidth colon
    s = s.replace("：", ":")
    for fmt in ("%H:%M:%S", "%H:%M", "%I:%M %p", "%I:%M%p"):
        try:
            return datetime.strptime(s, fmt).time()
        except ValueError:
            pass
    raise ValueError(f"Cannot parse time: {s!r}")


def parse_time_cell(val):
    """Return (start_time, end_time). Both may be None."""
    if val is None:
        return None, None
    if isinstance(val, float) and math.isnan(val):
        return None, None
    if isinstance(val, time_type):
        return val, None
    if isinstance(val, datetime):
        return val.time(), None
    s = str(val).strip()
    if not s or s.lower() in ("nan", "全天", "all day", "alldayelleday"):
        return None, None

    # Normalize fullwidth colon
    s = s.replace("：", ":")

    # Handle range separators: ~ ～ – - (but not minus in negative)
    for sep in ["~", "～", "–"]:
        if sep in s:
            parts = s.split(sep, 1)
            try:
                st = _parse_single_time(parts[0])
                et = _parse_single_time(parts[1])
                return st, et
            except Exception:
                pass

    # "-" separator: only split if both parts look like times
    if "-" in s:
        parts = s.split("-", 1)
        if len(parts) == 2:
            try:
                st = _parse_single_time(parts[0])
                et = _parse_single_time(parts[1])
                return st, et
            except Exception:
                pass

    try:
        return _parse_single_time(s), None
    except Exception:
        return None, None


def times_to_epoch(date, start_t, end_t, default_minutes=45):
    start_dt = datetime(date.year, date.month, date.day, start_t.hour, start_t.minute, start_t.second)
    if end_t:
        end_dt = datetime(date.year, date.month, date.day, end_t.hour, end_t.minute, end_t.second)
        if end_dt <= start_dt:
            end_dt += timedelta(days=1)
    else:
        end_dt = start_dt + timedelta(minutes=default_minutes)
    return to_epoch_ms(start_dt), to_epoch_ms(end_dt)


# ── Helpers ────────────────────────────────────────────────────────────────────
def clean_cell(val):
    if val is None or (isinstance(val, float) and math.isnan(val)):
        return ""
    s = str(val).strip()
    return "" if s.lower() == "nan" else s


def make_event(venue_id, name, round_str, start_ms, end_ms, event_id):
    return {
        "id": str(event_id),
        "venue_id": venue_id,
        "name": name,
        "round": round_str,
        "is_medal_event": is_medal(round_str),
        "start_time": start_ms,
        "end_time": end_ms,
        "status": "scheduled",
        "participants": [],
        "broadcast_channel": None,
        "notes": None,
        "is_imported": True,
        "import_source": "excel_20260311",
    }


def gen_id(venue_id, sheet_name, suffix):
    return uuid.uuid5(uuid.NAMESPACE_DNS, f"{venue_id}_{sheet_name}_{suffix}")


def is_header_row(row):
    """True if this row looks like a header."""
    for val in row:
        s = clean_cell(val)
        if any(h in s for h in ["Date\n日期", "日期", "Time\n时间", "时间"]):
            if any(h in s for h in ["Date", "Time", "日期", "时间"]):
                return True
    return False


# ── Step 1: Add missing venue ──────────────────────────────────────────────────
def add_missing_venue():
    print("\n=== Step 1: Adding missing venue 沙滩田径 ===")
    venue = {
        "id": "a1000000-0000-0000-0000-000000000004",
        "name": "沙滩田径赛场",
        "short_name": "沙滩田径",
        "sport": "沙滩田径",
        "sport_icon": "🏃",
        "color": "#84cc16",
        "location": "三亚",
        "is_active": True,
    }
    resp = requests.post(f"{SUPABASE_URL}/rest/v1/venues", headers=HEADERS, json=venue)
    if resp.status_code in (200, 201):
        print("  Venue added/updated successfully.")
    else:
        print(f"  Warning: {resp.status_code} {resp.text}")


# ── Step 3: Delete all existing events ────────────────────────────────────────
def delete_all_events():
    print("\n=== Step 3: Deleting all existing events ===")
    resp = requests.delete(
        f"{SUPABASE_URL}/rest/v1/events?id=neq.00000000-0000-0000-0000-000000000000",
        headers=HEADERS,
    )
    if resp.status_code in (200, 204):
        print("  All events deleted.")
    else:
        print(f"  Warning: {resp.status_code} {resp.text}")


# ── Simple 4-col parser: date, time, event, phase ─────────────────────────────
def parse_simple_sheet(df, sheet_name, venue_id, default_minutes=45):
    """
    Columns: 0=date, 1=time, 2=event_name, 3=phase
    The event_name cells often already contain 'Chinese\nEnglish'.
    """
    events = []
    current_date = None
    current_start_t = None
    current_end_t = None
    prev_end_ms = None
    row_idx = 0

    for ri, row in df.iterrows():
        # Skip header rows
        if is_header_row(row):
            continue

        raw_date = row.iloc[0] if len(row) > 0 else None
        raw_time = row.iloc[1] if len(row) > 1 else None
        raw_event = row.iloc[2] if len(row) > 2 else None
        raw_phase = row.iloc[3] if len(row) > 3 else None

        # Date forward-fill
        parsed_date = parse_date(raw_date)
        if parsed_date:
            current_date = parsed_date

        if current_date is None:
            continue

        # Time
        start_t, end_t = parse_time_cell(raw_time)
        if start_t is not None:
            current_start_t = start_t
            current_end_t = end_t

        # Determine timestamps
        if current_start_t is None:
            if prev_end_ms is not None:
                start_ms = prev_end_ms + 5 * 60 * 1000
                end_ms = start_ms + default_minutes * 60 * 1000
            else:
                continue
        else:
            start_ms, end_ms = times_to_epoch(current_date, current_start_t, current_end_t, default_minutes)

        # Event name
        event_str = clean_cell(raw_event)
        if not event_str:
            prev_end_ms = end_ms
            continue

        phase_str = extract_round(raw_phase)

        event_id = gen_id(venue_id, sheet_name, row_idx)
        ev = make_event(venue_id, event_str, phase_str, start_ms, end_ms, event_id)
        events.append(ev)
        prev_end_ms = end_ms
        row_idx += 1

    return events


# ── Multi-column parser: date, time, category, [group], game_no, court, teams, phase ──
def parse_multi_col_sheet(df, sheet_name, venue_id,
                           cat_col=2, teams_col=5, phase_col=7,
                           default_minutes=45):
    """
    For sheets: 水球, 三人篮球, 沙滩足球, 沙滩卡巴迪, 台克球
    Columns vary but pattern: date(0), time(1), category(cat_col), ..., teams(teams_col), phase(phase_col)
    """
    events = []
    current_date = None
    current_start_t = None
    current_end_t = None
    prev_end_ms = None
    row_idx = 0
    ncols = len(df.columns)

    for ri, row in df.iterrows():
        if is_header_row(row):
            continue

        raw_date = row.iloc[0]
        raw_time = row.iloc[1]
        raw_cat = row.iloc[cat_col] if ncols > cat_col else None

        # Use last non-empty relevant col as phase
        raw_phase = None
        for pc in [phase_col, phase_col - 1, ncols - 1]:
            if ncols > pc >= 0:
                candidate = row.iloc[pc]
                s = clean_cell(candidate)
                if s:
                    raw_phase = candidate
                    break

        # Date
        parsed_date = parse_date(raw_date)
        if parsed_date:
            current_date = parsed_date

        if current_date is None:
            continue

        # Time
        start_t, end_t = parse_time_cell(raw_time)
        if start_t is not None:
            current_start_t = start_t
            current_end_t = end_t

        if current_start_t is None:
            if prev_end_ms is not None:
                start_ms = prev_end_ms + 5 * 60 * 1000
                end_ms = start_ms + default_minutes * 60 * 1000
            else:
                continue
        else:
            start_ms, end_ms = times_to_epoch(current_date, current_start_t, current_end_t, default_minutes)

        # Build name from category + teams (or game number)
        # Try to find the most descriptive column
        cat_str = clean_cell(raw_cat)

        # teams column
        teams_str = ""
        if ncols > teams_col:
            teams_str = clean_cell(row.iloc[teams_col])

        # game/group info columns (between cat and teams)
        extra_parts = []
        for col_i in range(cat_col + 1, min(teams_col, ncols)):
            s = clean_cell(row.iloc[col_i])
            if s and s not in extra_parts and not s.isdigit():
                extra_parts.append(s)

        parts = [p for p in [cat_str] + extra_parts + [teams_str] if p]
        if not parts:
            prev_end_ms = end_ms
            continue

        event_str = " ".join(parts)
        phase_str = extract_round(raw_phase)

        event_id = gen_id(venue_id, sheet_name, row_idx)
        ev = make_event(venue_id, event_str, phase_str, start_ms, end_ms, event_id)
        events.append(ev)
        prev_end_ms = end_ms
        row_idx += 1

    return events


# ── Beach Athletics: dual-day side-by-side layout ─────────────────────────────
def parse_beach_athletics(df, sheet_name, venue_id):
    """Left half: cols 0-3. Right half: cols 6-9."""
    events = []
    row_idx = 0

    def parse_half(date_col, time_col, event_col, phase_col, label):
        nonlocal row_idx
        current_date = None
        current_start_t = None
        current_end_t = None
        prev_end_ms = None
        half_events = []
        ncols = len(df.columns)

        for ri, row in df.iterrows():
            if ncols <= date_col:
                continue

            raw_date = row.iloc[date_col]
            raw_time = row.iloc[time_col] if ncols > time_col else None
            raw_event = row.iloc[event_col] if ncols > event_col else None
            raw_phase = row.iloc[phase_col] if ncols > phase_col else None

            # Skip header-like rows
            d_str = clean_cell(raw_date)
            t_str = clean_cell(raw_time)
            if "日期" in d_str or "Date" in d_str:
                continue
            if "时间" in t_str or "Time" in t_str:
                continue

            parsed_date = parse_date(raw_date)
            if parsed_date:
                current_date = parsed_date

            if current_date is None:
                continue

            start_t, end_t = parse_time_cell(raw_time)
            if start_t is not None:
                current_start_t = start_t
                current_end_t = end_t

            if current_start_t is None:
                if prev_end_ms is not None:
                    start_ms = prev_end_ms + 5 * 60 * 1000
                    end_ms = start_ms + 45 * 60 * 1000
                else:
                    continue
            else:
                start_ms, end_ms = times_to_epoch(current_date, current_start_t, current_end_t, 45)

            event_str = clean_cell(raw_event)
            if not event_str:
                prev_end_ms = end_ms
                continue

            phase_str = extract_round(raw_phase)
            event_id = gen_id(venue_id, sheet_name, f"{label}_{row_idx}")
            ev = make_event(venue_id, event_str, phase_str, start_ms, end_ms, event_id)
            half_events.append(ev)
            prev_end_ms = end_ms
            row_idx += 1

        return half_events

    events.extend(parse_half(0, 1, 2, 3, "left"))
    if len(df.columns) > 9:
        events.extend(parse_half(6, 7, 8, 9, "right"))

    return events


# ── Beach Handball: special multi-col with time ranges ────────────────────────
def parse_beach_handball(df, sheet_name, venue_id):
    """
    Columns: date(0), time(1), category(2), group(3), game_no(4), court(5), teams(6), phase(7)
    Time already has ranges like "10:00-10:40".
    """
    events = []
    current_date = None
    row_idx = 0
    ncols = len(df.columns)

    for ri, row in df.iterrows():
        if is_header_row(row):
            continue

        raw_date = row.iloc[0]
        raw_time = row.iloc[1]
        raw_cat = row.iloc[2] if ncols > 2 else None
        raw_group = row.iloc[3] if ncols > 3 else None
        raw_teams = row.iloc[6] if ncols > 6 else None
        raw_phase = row.iloc[7] if ncols > 7 else None

        parsed_date = parse_date(raw_date)
        if parsed_date:
            current_date = parsed_date

        if current_date is None:
            continue

        start_t, end_t = parse_time_cell(raw_time)
        if start_t is None:
            continue

        start_ms, end_ms = times_to_epoch(current_date, start_t, end_t, 40)

        cat_str = clean_cell(raw_cat)
        group_str = clean_cell(raw_group)
        teams_str = clean_cell(raw_teams)

        parts = [p for p in [cat_str, group_str, teams_str] if p]
        if not parts:
            continue

        event_str = " ".join(parts)
        phase_str = extract_round(raw_phase)

        event_id = gen_id(venue_id, sheet_name, row_idx)
        ev = make_event(venue_id, event_str, phase_str, start_ms, end_ms, event_id)
        events.append(ev)
        row_idx += 1

    return events


# ── Beach Volleyball ──────────────────────────────────────────────────────────
def parse_beach_volleyball(df, sheet_name, venue_id):
    """
    Columns: date(0), time(1), category(2), game_info(3), court(4), teams(5), phase(6)
    End time = start + 55 min
    """
    events = []
    current_date = None
    current_start_t = None
    row_idx = 0
    ncols = len(df.columns)

    for ri, row in df.iterrows():
        if is_header_row(row):
            continue

        raw_date = row.iloc[0]
        raw_time = row.iloc[1]
        raw_cat = row.iloc[2] if ncols > 2 else None
        raw_game = row.iloc[3] if ncols > 3 else None
        raw_phase = row.iloc[6] if ncols > 6 else (row.iloc[-1] if ncols > 4 else None)

        parsed_date = parse_date(raw_date)
        if parsed_date:
            current_date = parsed_date

        if current_date is None:
            continue

        start_t, end_t = parse_time_cell(raw_time)
        if start_t is not None:
            current_start_t = start_t

        if current_start_t is None:
            continue

        start_ms, end_ms = times_to_epoch(current_date, current_start_t, end_t, 55)

        cat_str = clean_cell(raw_cat)
        game_str = clean_cell(raw_game)

        parts = [p for p in [cat_str, game_str] if p]
        if not parts:
            continue

        event_str = " ".join(parts)
        phase_str = extract_round(raw_phase) or "小组赛"

        event_id = gen_id(venue_id, sheet_name, row_idx)
        ev = make_event(venue_id, event_str, phase_str, start_ms, end_ms, event_id)
        events.append(ev)
        row_idx += 1

    return events


# ── Teqball: time ranges, category in col2, phase in col3 ────────────────────
def parse_teqball(df, sheet_name, venue_id):
    """
    Columns: date(0), time(1), category(2), phase(3), game_no(4), court(5), teams(6/nan), match(7)
    """
    events = []
    current_date = None
    row_idx = 0
    ncols = len(df.columns)

    for ri, row in df.iterrows():
        if is_header_row(row):
            continue

        raw_date = row.iloc[0]
        raw_time = row.iloc[1]
        raw_cat = row.iloc[2] if ncols > 2 else None
        raw_phase = row.iloc[3] if ncols > 3 else None
        raw_match = row.iloc[7] if ncols > 7 else None

        parsed_date = parse_date(raw_date)
        if parsed_date:
            current_date = parsed_date

        if current_date is None:
            continue

        start_t, end_t = parse_time_cell(raw_time)
        if start_t is None:
            continue

        start_ms, end_ms = times_to_epoch(current_date, start_t, end_t, 30)

        cat_str = clean_cell(raw_cat)
        match_str = clean_cell(raw_match)

        parts = [p for p in [cat_str, match_str] if p]
        if not parts:
            continue

        event_str = " ".join(parts)
        phase_str = extract_round(raw_phase)

        event_id = gen_id(venue_id, sheet_name, row_idx)
        ev = make_event(venue_id, event_str, phase_str, start_ms, end_ms, event_id)
        events.append(ev)
        row_idx += 1

    return events


# ── Step 5: Batch insert ──────────────────────────────────────────────────────
def batch_insert(events, batch_size=50):
    inserted = 0
    for i in range(0, len(events), batch_size):
        batch = events[i:i + batch_size]
        resp = requests.post(
            f"{SUPABASE_URL}/rest/v1/events",
            headers=HEADERS,
            data=json.dumps(batch),
        )
        if resp.status_code in (200, 201):
            inserted += len(batch)
            print(f"  Batch {i // batch_size + 1}: {len(batch)} events → HTTP {resp.status_code} OK")
        else:
            print(f"  ERROR batch {i // batch_size + 1}: {resp.status_code} {resp.text[:400]}")
    return inserted


# ── Main ──────────────────────────────────────────────────────────────────────
def main():
    add_missing_venue()
    delete_all_events()

    print(f"\n=== Step 4: Reading Excel file ===")
    try:
        xl = pd.ExcelFile(EXCEL_FILE)
    except Exception as e:
        print(f"ERROR opening Excel: {e}")
        return

    print(f"  Sheets: {xl.sheet_names}")

    all_events = []
    venue_counts = {}

    for sheet_name in xl.sheet_names:
        # Match venue
        venue_id = None
        for key, vid in VENUE_MAP.items():
            if key in sheet_name:
                venue_id = vid
                break

        if venue_id is None:
            print(f"\n  [SKIP] '{sheet_name}' — no venue match")
            continue

        df = xl.parse(sheet_name, header=None)
        print(f"\n  Parsing '{sheet_name}' ({len(df)} rows, {len(df.columns)} cols)")

        if "沙滩田径" in sheet_name:
            events = parse_beach_athletics(df, sheet_name, venue_id)

        elif "沙滩排球" in sheet_name:
            events = parse_beach_volleyball(df, sheet_name, venue_id)

        elif "沙滩手球" in sheet_name:
            events = parse_beach_handball(df, sheet_name, venue_id)

        elif "台克球" in sheet_name:
            events = parse_teqball(df, sheet_name, venue_id)

        elif any(k in sheet_name for k in ["水球", "三人篮球", "沙滩足球", "沙滩卡巴迪"]):
            # multi-col: date, time, category, group(opt), game_no, court, teams, phase
            ncols = len(df.columns)
            # Detect teams_col and phase_col
            if ncols >= 8:
                events = parse_multi_col_sheet(df, sheet_name, venue_id,
                                               cat_col=2, teams_col=5, phase_col=7)
            elif ncols >= 6:
                events = parse_multi_col_sheet(df, sheet_name, venue_id,
                                               cat_col=2, teams_col=4, phase_col=5)
            else:
                events = parse_simple_sheet(df, sheet_name, venue_id)

        else:
            # Simple 4-col: date, time, event, phase
            events = parse_simple_sheet(df, sheet_name, venue_id)

        print(f"    → Parsed {len(events)} events")
        all_events.extend(events)
        venue_counts[sheet_name] = len(events)

    print(f"\n=== Step 5: Inserting {len(all_events)} total events ===")
    total = batch_insert(all_events)

    print("\n=== Summary ===")
    for sheet, count in venue_counts.items():
        print(f"  {sheet}: {count} events")
    print(f"\n  Total events inserted: {total}")


if __name__ == "__main__":
    main()
