@echo off
title Multitool - made by Brahim
chcp 65001 >nul

:: Display the banner first
cls
echo.
echo		███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗     
echo		████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo		██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     
echo		██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     
echo		██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗
echo		╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo                    Multitool
echo.
pause

:: Call menu after the banner
call :menu

:menu
cls
echo 1) Launch Google Chrome
echo 2) Microsoft Edge
echo 3) Roblox Player
echo 4) Roblox Studio
echo 5) Exit
set /p choice="Select an option: "

:: Check user's choice and open the corresponding application
if "%choice%"=="1" start chrome
if "%choice%"=="2" start msedge
if "%choice%"=="3" call :launchRobloxPlayer
if "%choice%"=="4" call :launchRobloxStudio
if "%choice%"=="5" exit

:: If the input is invalid, ask again
echo Invalid choice, please select a valid option.
pause
goto menu

:launchRobloxPlayer
:: Dynamically select the most recent Roblox Player version
for /f "delims=" %%i in ('dir /b /ad "C:\Users\%USERNAME%\AppData\Local\Roblox\Versions"') do (
    start "" "C:\Users\%USERNAME%\AppData\Local\Roblox\Versions\%%i\RobloxPlayerLauncher.exe"
    goto :eof
)
echo Roblox Player not found.
pause
goto :menu

:launchRobloxStudio
:: Dynamically select the most recent Roblox Studio version
for /f "delims=" %%i in ('dir /b /ad "C:\Program Files (x86)\Roblox\Versions"') do (
    start "" "C:\Program Files (x86)\Roblox\Versions\%%i\RobloxStudioLauncherBeta.exe"
    goto :eof
)
echo Roblox Studio not found.
pause
goto :menu
