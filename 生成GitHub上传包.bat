@echo off
chcp 65001 >nul
cd /d "%~dp0"
title 生成 GitHub 上传文件
echo.
echo 正在构建，请稍候...
call npm run build:root
if errorlevel 1 (
  echo 构建失败
  pause
  exit /b 1
)

echo.
echo ========================================
echo   完成！请上传这个文件夹里的内容：
echo   上传到GitHub
echo ========================================
echo.
echo 里面包含：
echo   - index.html
echo   - assets 文件夹  （必须有）
echo   - favicon.svg
echo.

explorer "%~dp0上传到GitHub"
pause
