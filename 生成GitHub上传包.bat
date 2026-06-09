@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ========================================
echo   准备 GitHub 上传文件
echo ========================================
call npm run build:root
if errorlevel 1 goto err

echo.
echo ========================================
echo   重要！请严格按下面做：
echo ========================================
echo.
echo  1. 会打开「上传到GitHub」文件夹
echo  2. 选中这 3 项（按住 Ctrl 多选）：
echo       [x] index.html
echo       [x] assets 文件夹
echo       [x] favicon.svg
echo  3. 打开网页：
echo     https://github.com/hufelix765-alt/my-hetong/upload
echo  4. 把选中的 3 项拖进网页
echo  5. 点 Commit changes
echo.
echo  !! 不要上传 zip 文件 !!
echo  !! 不要上传「上传到GitHub」文件夹本身 !!
echo  !! 必须包含 assets 文件夹 !!
echo.

explorer "%~dp0上传到GitHub"
start "" "https://github.com/hufelix765-alt/my-hetong/upload"
pause
exit /b 0

:err
echo 构建失败
pause
exit /b 1
