#!/bin/bash

# Image Background Remover - 自动部署脚本

echo "🚀 开始部署..."

# 1. 进入项目目录
cd ~/projects/image-background-remover329

# 2. 设置环境变量（如果没有参数传入）
if [ -z "$1" ]; then
    export CLOUDFLARE_API_TOKEN="cfut_7ifaB3T4JZxI7ZLaRynEQWVI5Omm8mJ1m3ygmgw7b6566a34"
else
    export CLOUDFLARE_API_TOKEN="$1"
fi

# 3. 构建项目
echo "📦 构建中..."
rm -rf .next .vercel
npm run build

# 4. 转换为 Cloudflare 格式
echo "🔄 转换为 Cloudflare 格式..."
npx @cloudflare/next-on-pages

# 5. 修复路由配置
echo "⚙️ 修复路由..."
echo '{"version":1,"description":"Fixed routes","include":["/*"],"exclude":[]}' > .vercel/output/static/_routes.json

# 6. 部署到 Cloudflare Pages
echo "🚀 部署到 Cloudflare..."
wrangler pages deployment create .vercel/output/static \
    --project-name=image-background-remover-new \
    --branch=master

echo "✅ 部署完成！"
echo "🌐 访问地址: https://image-background-remover-new-wlc.pages.dev"