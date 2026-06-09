# GitHub Pages 部署指南

## 关键原则

GitHub Pages **只能托管静态文件**，不能直接运行 React 源码。

| 目录 | 用途 |
|------|------|
| `index.html` + `src/` | 本地开发用 ❌ |
| `docs/` | 构建后的网站 ✅ 给 GitHub 用 |

## 三步部署

```powershell
npm run build:github
git add .
git commit -m "更新网站"
git push origin main
```

GitHub → Settings → Pages：

- Source: **Deploy from a branch**
- Branch: **main**
- Folder: **/docs**（⚠️ 不是 /root）

## 验证

访问 https://hufelix765-alt.github.io/my-hetong/

F12 → Network 应看到 `/my-hetong/assets/xxx.js`，而不是 `/src/main.tsx`。

## 网页上传方式

若用 GitHub 网页上传：

1. 先在本机运行 `npm run build:github`
2. 上传整个 **`docs`** 文件夹到仓库
3. Pages 设置改为 **main / docs**
