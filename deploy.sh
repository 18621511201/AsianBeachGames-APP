#!/bin/bash
cd "$(dirname "$0")"
[ -f ".env.local" ] && source ".env.local"
echo "📦 正在打包..."
git add -A
git commit -m "${1:-更新 $(date '+%Y-%m-%d %H:%M')}"
echo "🚀 正在推送到 GitHub..."
git push https://18621511201:${GH_TOKEN}@github.com/18621511201/AsianBeachGames-APP.git main
echo "✅ 完成！Netlify 将在约 30 秒内自动重新部署"
echo "🌐 主界面：https://livecue.netlify.app/live-cue-admin.html"
echo "🌐 主题页：https://livecue.netlify.app/live-cue-themes.html"
