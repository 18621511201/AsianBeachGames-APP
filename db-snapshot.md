# 数据库快照 — 2026-03-16

## Supabase 项目
- URL: https://mdgfcgxtlxgzkvoiqonp.supabase.co
- 项目 ID: mdgfcgxtlxgzkvoiqonp
- ANON KEY: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kZ2ZjZ3h0bHhnemt2b2lxb25wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM1NTcwMjIsImV4cCI6MjA4OTEzMzAyMn0.ds9Ab_HkRNsUDSUrTlfJ5NpmlywgWwotNei4YX3Oo-k
- SECRET KEY: sb_secret_LGFZ6XFx1Ri20x6bufWkIQ_wH-1IRK0

## 数据库当前状态（基准状态）
- 总赛程数: 566 条（从 Excel 完整导入）
- 导入源: 20260311竞赛单元日程(1).xlsx
- 恢复方式: 运行 live-cue-api-import.py

## 用户账号
- roman.lingchen@gmail.com（主账号）
- admin2@abg2026.com / admin2（管理员2）

## 场馆（15个）
| 场馆 | venue_id |
|------|----------|
| 公开水域游泳赛场 | 4a147646-352e-430e-a2d6-e8e94ebf6efc |
| 水球赛场 | 3df0915d-b392-4a5c-8bb4-eeef9a37e383 |
| 三人篮球赛场 | 8e1ff289-c09d-4ac7-8d8e-5c4b8995e43e |
| 沙滩田径赛场 | a1000000-0000-0000-0000-000000000004 |
| 龙舟赛场 | 168d75d7-182f-45a1-b844-6551ddf2fc28 |
| 沙滩足球赛场 | 4fb29d01-a16a-4168-ba38-e83b2b94d91a |
| 沙滩手球赛场 | e11756c7-5c63-4e87-8292-bc1cf2dc9e16 |
| 柔术赛场 | 91e0d0cd-3978-4124-896c-3e0c3f6b98b8 |
| 沙滩卡巴迪赛场 | 7c93d281-e16a-4072-9aba-53dfa2990eef |
| 帆船赛场 | b11d3e71-dd0a-49f1-8877-c3ac16a1a090 |
| 攀岩赛场 | eb83d189-4c5b-49b6-b153-efbf771b3f46 |
| 台克球赛场 | 972d8dde-15dc-4d10-9c20-e1eee01e80ff |
| 游跑两项赛场 | 46ec26b2-5acf-48d4-b5d0-830a4f4f0e50 |
| 沙滩排球赛场 | c438dbde-e947-42c2-baed-ed0d9ee10ad6 |
| 沙滩摔跤赛场 | 8018d568-672c-49c8-b46b-70b72908b386 |

## ⚠️ 注意事项
- 数据库 566 条赛程是基准，不要轻易删除
- 如需恢复数据库：cd Desktop && python3 live-cue-api-import.py
- 前端筛选通过 selectedRounds 控制，不影响数据库
