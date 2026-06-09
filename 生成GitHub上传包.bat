@echo off
chcp 65001 >nul
cd /d "%~dp0"
title 生成 GitHub 上传包
echo.
echo 正在构建...
call npm run build:root
if errorlevel 1 (
  echo 构建失败
  pause
  exit /b 1
)

echo.
echo 正在打包 publish-root 为 zip...
powershell -Command "Compress-Archive -Path 'publish-root\*' -DestinationPath 'github-upload.zip' -Force"

echo.
echo ========================================
echo   完成！请按以下步骤上传到 GitHub
echo ========================================
echo.
echo 1. 打开 https://github.com/hufelix765-alt/my-hetong
echo 2. 点击 Add file - Upload files
echo 3. 把 github-upload.zip 解压后，拖入全部文件
echo    （index.html、assets 文件夹、favicon.svg）
echo 4. Commit changes
echo 5. Pages 设置保持: main / (root)
echo.
echo 6. 等 2 分钟后访问:
echo    https://hufelix765-alt.github.io/my-hetong/
echo.
pause
