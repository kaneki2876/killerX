@echo off
:check
for /f "Delims=" %%a in (upkillerX.txt) do (

set TEXT=%%a

)

if 1.0==%TEXT% goto no
echo.
echo update - install
del /f /s /q main
curl -L -O https://github.com/kaneki2876/killerX/archive/refs/heads/main.zip


:no
echo.
echo update - not found
ping -n %se% 127.0.0.1 >nul
