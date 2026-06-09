# 合同审核系统

以《民法典》合同编为基础模板，支持中英文双语审核、单条条款检索、左右分栏/上下排列双语排版。

在线地址：https://hufelix765-alt.github.io/my-hetong/

## 本地运行

```powershell
npm install
npm run dev
```

## 发布到 GitHub Pages

```powershell
npm run build:github
```

然后：

1. 用 GitHub Desktop 或 `git push` 上传（**必须包含 `docs/` 文件夹**）
2. GitHub → Settings → Pages → **main / docs**（不是 /root）

详细说明见 [DEPLOY.md](./DEPLOY.md)

## 主要功能

- **合同审核** — 上传合同对照民法典模板，识别缺失/部分匹配条款
- **条款检索** — 按关键词单条搜索中英文条款
- **民法典类型** — 19 章合同类型，22 套双语标准模板
- **双语排版** — 左右分栏，或上中文下英文 / 上英文下中文
- **Word 导出** — 导出格式与预览排版一致

## License

MIT
