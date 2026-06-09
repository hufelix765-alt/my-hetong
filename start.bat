@echo off
cd /d "%~dp0"
echo 正在启动合同审核系统...
echo.
if not exist node_modules (
  echo 首次运行，正在安装依赖...
  call npm install
)
start http://localhost:5173
call npm run dev
