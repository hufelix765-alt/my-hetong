@echo off
chcp 65001 >nul
cd /d "%~dp0"
title 合同审核系统
echo.
echo ========================================
echo   合同审核系统 - 本地启动
echo ========================================
echo.

if not exist node_modules (
  echo [1/2] 首次运行，安装依赖...
  call npm install
  if errorlevel 1 (
    echo 安装失败，请检查网络
    pause
    exit /b 1
  )
)

echo [2/2] 启动开发服务器...
echo.
echo 浏览器将自动打开: http://127.0.0.1:5173
echo 若未自动打开，请手动复制上面地址到 Chrome/Edge
echo 按 Ctrl+C 可停止
echo.

start "" "http://127.0.0.1:5173"
call npm run dev
pause
