# 合同模板管理系统

基于《中华人民共和国民法典》合同编的智能合同模板网站。支持条款在线编辑、中英文对照、Word/PDF 导出、合同比对分析及跨合同条款检索。

## 功能特性

- **26 类内置合同模板**：19 类民法典标准合同 + 外贸采购 + 代工（OEM/ODM）+ 专利 / 商标 / 软著代理
- **逐条编辑**：每条条款可独立修改，支持中文、英文及双语对照
- **一键导出**：生成并下载 Word（.docx）或 PDF 文件
- **合同比对**：上传 .docx / .pdf / .txt 合同，与标准模板比对，识别缺失条款、分析风险并给出修改建议
- **条款检索**：按标签（如知识产权、违约责任）检索不同合同中的相关约定，支持一键复制
- **非标准合同**：名称不在标准库中的合同可单独创建管理

## 技术栈

- React 19 + TypeScript + Vite
- Tailwind CSS 4
- docx / jsPDF / mammoth / pdf.js

## 快速开始

```bash
npm install
npm run dev
```

浏览器访问 http://localhost:5173

## 构建与部署

### 本地开发

```bash
npm run dev
```

浏览器访问 http://localhost:5173

### GitHub Pages（my-hetong 仓库）

站点地址：https://hufelix765-alt.github.io/my-hetong/

```bash
npm run build:pages
```

构建产物在 `dist/` 目录（含 `404.html`，用于 SPA 路由）。本地预览 Pages 效果：

```bash
npm run preview:pages
```

访问 http://localhost:4173/my-hetong/

**推送到 GitHub 后自动部署：**

1. 仓库 **Settings → Pages → Build and deployment** 选择 **GitHub Actions**
2. 将代码 push 到 `main` 或 `master` 分支，`.github/workflows/deploy.yml` 会自动构建并发布

也可手动将 `dist/` 目录内容上传到 gh-pages 分支或 Pages 源目录。

## 免责声明

本系统提供的合同模板仅供参考，不构成法律意见。正式签署前请咨询专业律师。

## License

MIT
