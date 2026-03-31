# Image Background Remover - MVP 需求文档

## 1. 项目概述

| 项目 | 内容 |
|------|------|
| **项目名称** | Image Background Remover |
| **核心功能** | 上传图片，自动移除背景，下载无背景图片 |
| **目标用户** | 设计师、电商卖家、内容创作者 |
| **技术栈** | Next.js (App Router) + Cloudflare Pages + remove.bg API |

---

## 2. 功能范围

### 2.1 核心功能 (MVP)

| 功能 | 描述 | 优先级 |
|------|------|--------|
| 图片上传 | 支持拖拽或点击上传图片 | P0 |
| 自动去背 | 调用 remove.bg API 移除背景 | P0 |
| 图片预览 | 同时展示原图和处理后的图片 | P0 |
| 图片下载 | 一键下载去背后的图片 | P0 |
| 加载状态 | 上传/处理中的loading动画 | P0 |

---

## 3. 用户流程

```
访问首页 → 上传图片 → 处理中 → 下载结果
```

---

## 4. 技术方案

### 4.1 架构

```
用户浏览器 (前端 Next.js) → Cloudflare (API Routes) → remove.bg API
```

### 4.2 环境变量

| 变量名 | 说明 |
|--------|------|
| `REMOVE_BG_API_KEY` | remove.bg API 密钥 |

---

## 5. 部署

```bash
# 安装依赖
npm install

# 开发
npm run dev

# 构建
npm run build

# 部署到 Cloudflare
npm run deploy
```

---

## 6. 成本估算

| 项目 | 免费版额度 | 超出费用 |
|------|-----------|----------|
| remove.bg API | 500张/月 | $0.015/张 |
| Cloudflare Pages | 免费 | - |

---

*文档版本：v1.0*
*创建时间：2026-03-31*
