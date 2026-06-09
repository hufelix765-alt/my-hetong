# GitHub Pages 部署指南

## ⚠️ 当前 GitHub 仓库的问题

远程仓库 **缺少 `src/` 和 `docs/` 文件夹**，只有配置文件，所以线上打不开。

必须用 **GitHub Desktop 推送完整项目**，不能只网页上传几个文件。

---

## 本地打不开（Connection Failed）

`ERR_CONNECTION_REFUSED` = 开发服务器没启动。

**方法 1：** 双击项目里的 `start.bat`

**方法 2：**
```powershell
cd C:\Users\14546\Desktop\hetongmoban
npm install
npm run dev
```
浏览器打开：**http://localhost:5173**

---

## 线上部署（推荐：GitHub Actions 自动构建）

### 第 1 步：推送完整代码

用 GitHub Desktop：
1. File → Add local repository → 选 `C:\Users\14546\Desktop\hetongmoban`
2. Commit 全部文件（必须含 `src/`、`.github/workflows/`）
3. Push origin

### 第 2 步：改 Pages 设置

https://github.com/hufelix765-alt/my-hetong/settings/pages

| 项目 | 选择 |
|------|------|
| Source | **GitHub Actions** |

保存后等 2～3 分钟，Actions 标签页出现绿色 ✓ 即成功。

---

## 备选：手动 docs 部署

```powershell
npm run build:github
```

推送后 Pages 设为 **main / docs**（不是 /root）。

---

## 验证

https://hufelix765-alt.github.io/my-hetong/

F12 → Network 应看到 `/my-hetong/assets/xxx.js`
