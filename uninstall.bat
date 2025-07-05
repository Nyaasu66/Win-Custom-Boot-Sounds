@echo off
set SERVICE_NAME=SoundService

sc stop %SERVICE_NAME%
sc delete %SERVICE_NAME%

echo Service uninstalled!
pause