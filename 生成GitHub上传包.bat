@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ========================================
echo   准备 GitHub 上传（稳定版）
echo ========================================
call npm run build:root
if errorlevel 1 goto err

echo.
echo 【重要】上传前请先在 GitHub 删除旧的 assets 文件夹！
echo.
echo 然后上传「上传到GitHub」里的 4 项：
echo   index.html
echo   assets 文件夹（新的）
echo   favicon.svg
echo   .nojekyll
echo.

explorer "%~dp0上传到GitHub"
start "" "https://github.com/hufelix765-alt/my-hetong/upload"
pause
exit /b 0

:err
echo 构建失败
pause
exit /b 1
