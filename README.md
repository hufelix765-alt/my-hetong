# 合同模板管理系统

基于《中华人民共和国民法典》合同编的智能合同模板**网页应用**。支持条款在线编辑、中英文对照、Word/PDF 导出、合同比对分析及跨合同条款检索。

**在线地址：** https://hufelix765-alt.github.io/my-hetong/

## 本地运行

```bash
npm install
npm run dev
```

浏览器打开 http://localhost:5173

## 发布到 GitHub Pages（静态网页）

网页样式与功能都在 `dist/` 构建产物里。**不要把源码根目录直接当 Pages 发布**，否则页面会空白。

### 第一步：推送代码到 GitHub

```powershell
cd C:\Users\14546\Desktop\hetongmoban
git add .
git commit -m "更新合同模板网页"
git push origin main
```

### 第二步：开启自动部署（只需设置一次）

1. 打开 https://github.com/hufelix765-alt/my-hetong/settings/pages
2. **Build and deployment → Source** 选择 **GitHub Actions**
3. 回到 **Actions** 标签，确认 “Deploy to GitHub Pages” 工作流运行成功（绿色 ✓）

约 1–2 分钟后访问：https://hufelix765-alt.github.io/my-hetong/

### 备选：手动发布到 gh-pages 分支

若 Actions 不可用，在本机执行（需能连接 GitHub）：

```powershell
npm run deploy:gh
```

然后在 **Settings → Pages** 中选择 Branch：**gh-pages** / **/(root)**

## 本地预览（与线上一致）

```powershell
npm run preview:pages
```

访问 http://localhost:4173/my-hetong/

## 构建命令

| 命令 | 用途 |
|------|------|
| `npm run build` | 本地或自有域名根路径部署 |
| `npm run build:pages` | GitHub Pages（路径 `/my-hetong/`） |
| `npm run deploy:gh` | 构建并推送到 gh-pages 分支 |

## 免责声明

本系统提供的合同模板仅供参考，不构成法律意见。正式签署前请咨询专业律师。

## License

MIT
