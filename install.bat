@echo off
set SERVICE_NAME=SoundService
set ROOT=%~dp0
set BIN_PATH="%~dp0bin\Release\net9.0\win-x64\publish\SoundService.exe"

:: 创建音频目录
mkdir C:\Sounds 2>nul

:: 复制你的音频文件到C:\Sounds
copy /Y %~dp0startup.wav C:\Sounds
copy /Y %~dp0shutdown.wav C:\Sounds

:: 安装服务
sc create %SERVICE_NAME% binPath=%BIN_PATH% start=auto
sc description %SERVICE_NAME% "Plays custom sounds on system events"

:: 设置服务恢复策略
sc failure %SERVICE_NAME% reset=0 actions=restart/5000

:: 启动服务
sc start %SERVICE_NAME%

echo Service installed successfully!
pause