@echo off
set SERVICE_NAME=SoundService
set "ROOT=%~dp0"
set BIN_PATH="%~dp0bin\Release\net9.0\win-x64\publish\SoundService.exe"

:: 创建音频目录
mkdir C:\Sounds 2>nul

:: 复制你的音频文件到C:\Sounds
:: 复制音频文件（确保与bat文件同目录）
if exist "%ROOT%startup.wav" (
    copy /Y "%ROOT%startup.wav" "C:\Sounds"
) else (
    echo Error: startup.wav not found in %ROOT%
)

if exist "%ROOT%shutdown.wav" (
    copy /Y "%ROOT%shutdown.wav" "C:\Sounds"
) else (
    echo Error: shutdown.wav not found in %ROOT%
)

:: 安装服务
echo Installing service...
sc create %SERVICE_NAME% binPath=%BIN_PATH% start=auto
sc description %SERVICE_NAME% "Plays custom sounds on system events"

:: 设置服务恢复策略
sc failure %SERVICE_NAME% reset=0 actions=restart/5000

:: 启动服务
sc start %SERVICE_NAME%

if %errorlevel% equ 0 (
    echo Service started successfully!
) else (
    echo Failed to start service.
)

echo Installation complete. Check sound files in C:\Sounds
pause