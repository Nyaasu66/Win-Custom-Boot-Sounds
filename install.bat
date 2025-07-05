@echo off
chcp 65001 > nul
set SERVICE_NAME=SoundService
set BIN_PATH="%~dp0bin\Release\net9.0\win-x64\publish\SoundService.exe"

echo [INFO] Creating sound directory...
mkdir C:\Sounds 2>nul

echo [INFO] Copying sound files...
if exist "%~dp0startup.wav" (
    copy /Y "%~dp0startup.wav" C:\Sounds > nul
) else (
    echo [WARNING] startup.wav not found in current directory
)

if exist "%~dp0shutdown.wav" (
    copy /Y "%~dp0shutdown.wav" C:\Sounds > nul
) else (
    echo [WARNING] shutdown.wav not found in current directory
)

echo [INFO] Installing service...
sc create %SERVICE_NAME% binPath=%BIN_PATH% start=auto 2>&1 | findstr /v /c:"DESCRIPTION" > nul

sc description %SERVICE_NAME% "Plays custom sounds on system events" > nul
sc failure %SERVICE_NAME% reset=0 actions=restart/5000 > nul

echo [INFO] Starting service...
sc start %SERVICE_NAME% > nul

echo [SUCCESS] Service installed successfully!
echo You can restart your computer to test startup sound
echo Press any key to exit...
pause > nul