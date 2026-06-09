@echo off
chcp 65001 >nul
cd /d "%~dp0"
title 合同审核系统 - 线上预览
echo.
echo 构建并预览 GitHub 同款页面...
echo.

if not exist node_modules call npm install

call npm run build:pages
if errorlevel 1 (
  echo 构建失败
  pause
  exit /b 1
)

echo.
echo 浏览器将打开: http://127.0.0.1:4173/my-hetong/
echo 注意地址末尾有 /my-hetong/
echo.

start "" "http://127.0.0.1:4173/my-hetong/"
call npx vite preview --base /my-hetong/
pause
