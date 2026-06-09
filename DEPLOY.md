# GitHub 静态网页部署指南（从头梳理）

## 一、先理解：为什么本地好用、线上打不开？

| | 本地 `npm run dev` | GitHub 线上（当前错误状态） |
|---|---|---|
| 运行的是什么 | 开发服务器，实时编译 React | 浏览器直接打开 HTML 文件 |
| 需要什么 | Node.js + 源码 | **已构建好的** JS/CSS 静态文件 |
| 当前线上问题 | — | 发布的是**源码**（`/src/main.tsx`），浏览器加载失败 → **空白页** |

**结论：不是功能坏了，是 GitHub 发布的内容不对。**

---

## 二、项目里有两份「网页」

```
hetongmoban/
├── index.html          ← 开发用（含 /src/main.tsx）❌ 不能给 GitHub Pages 用
├── src/                ← 源代码 ❌ 不能给 GitHub Pages 用
├── docs/               ← ✅ 已构建的静态网页（给 GitHub 用）
│   ├── index.html      ← 含 /my-hetong/assets/xxx.js
│   ├── assets/         ← JS、CSS
│   └── 404.html        ← 子页面刷新用
└── dist/               ← 构建临时目录（与 docs 内容相同，不提交）
```

本地运行 `npm run build:github` 会更新 `docs/`。

---

## 三、当前 GitHub 上的真实状态（2026年检查）

- 远程仓库 **还没有** `docs/` 文件夹（404）
- 远程 `index.html` 仍是开发版（`/src/main.tsx`）
- 本地已有 4 个 commit **尚未 push 成功**
- Pages 设置很可能是：**main 分支 / (root)** → 正好发布了错误的源码

---

## 四、正确部署流程（请按顺序做）

### 步骤 1：在本机生成最新静态网页

```powershell
cd C:\Users\14546\Desktop\hetongmoban
npm install
npm run build:github
```

看到 `Copied dist/ → docs/` 即成功。

本地预览（应与线上一致）：

```powershell
npm run preview:pages
```

浏览器打开：http://localhost:4173/my-hetong/

### 步骤 2：上传到 GitHub

**推荐：GitHub Desktop**（避免命令行登录问题）

1. 下载安装 [GitHub Desktop](https://desktop.github.com/)
2. File → Add local repository → 选择 `C:\Users\14546\Desktop\hetongmoban`
3. 左侧看到更改的文件（应包含 `docs/` 文件夹）
4. 填写 Summary，点击 **Commit to main**
5. 点击 **Push origin**

**或命令行**（需已登录 GitHub）：

```powershell
git add .
git commit -m "更新静态网页"
git push origin main
```

### 步骤 3：修改 GitHub Pages 设置（最关键！）

1. 打开 https://github.com/hufelix765-alt/my-hetong/settings/pages
2. 设置如下：

| 项目 | 选择 |
|------|------|
| Build and deployment → Source | **Deploy from a branch** |
| Branch | **main** |
| Folder | **/docs** |

3. 点击 Save，等待 1～2 分钟

> ⚠️ 若选 **/(root)**，会继续发布源码，页面仍然空白！

### 步骤 4：验证是否成功

打开 https://hufelix765-alt.github.io/my-hetong/

按 F12 → Network，应能看到加载：

```
/my-hetong/assets/index-xxxxx.js   ✅
/my-hetong/assets/index-xxxxx.css  ✅
```

若仍是 `/src/main.tsx` → 说明 Pages 设置或 push 未生效，回到步骤 2、3。

---

## 五、备选方案：GitHub Actions 自动部署

若不想提交 `docs/` 文件夹：

1. Pages → Source 选 **GitHub Actions**
2. push 源码到 main 后，Actions 自动构建并发布
3. 在 Actions 标签查看 “Deploy to GitHub Pages” 是否绿色 ✓

---

## 六、以后每次更新网站

```powershell
# 1. 改完代码
npm run build:github

# 2. 提交并推送
git add .
git commit -m "更新网站"
git push origin main
# 或用 GitHub Desktop Push
```

---

## 七、常见问题

**Q：页面空白？**  
A：Pages 发布了源码。改为 **main / docs**，或启用 GitHub Actions。

**Q：样式丢失、404？**  
A：仓库名必须是 `my-hetong`，构建路径为 `/my-hetong/`（已配置好）。

**Q：子页面刷新 404？**  
A：`docs/404.html` 已包含，确保发布的是 `docs/` 目录。

**Q：和本地界面不一样？**  
A：先 `npm run preview:pages` 对比；一致后再 push + 改 Pages 设置。

---

## 八、网站地址

https://hufelix765-alt.github.io/my-hetong/

部署成功后，合同模板、合同比对（审核）、编辑导出等功能与本地一致。
