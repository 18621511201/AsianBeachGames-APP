#!/bin/bash
cd "$(dirname "$0")"
echo "📦 正在打包..."
git add -A
git commit -m "${1:-更新 $(date '+%Y-%m-%d %H:%M')}"
echo "🚀 正在推送到 GitHub..."
git push https://18621511201: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@github.com/18621511201/AsianBeachGames-APP.git main
echo "✅ 完成！Vercel 将在约 30 秒内自动重新部署"
echo "🌐 https://asian-beach-games-app.vercel.app"
