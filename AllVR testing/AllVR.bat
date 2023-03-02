@echo off
setlocal enabledelayedexpansion
echo Although the PCVR downloads are provided by ARMAGEDDON and are DDL, I am in no way affiliated with them.
echo This is just a fan project.
echo The quest 2 apk downloads use torrents, so you will have to get a magnet link from sites like rutracker.org
pause
:menu
echo.
echo 1. PCVR
echo 2. Quest Standalone
echo 3. Exit
echo.
set /p choice=Enter your choice: 

if "%choice%"=="1" (
    goto pcvr
)

if "%choice%"=="2" (
    echo You chose option 2
    goto torrenter
)

if "%choice%"=="3" (
    exit
)
REM had to use goto, beacuse somehow the variable is empty no matter what I do when I execute it inside the if statement
:pcvr
echo To search for games, press ctrl+f
pause
rclone lsf PCVR-1:/PCVR
set /p gamename=Enter the full name of the game:
echo Your choice is %gamename%
pause
mkdir "downloads/%gamename%"
rclone copy --stats 5s -v "PCVR-1:/PCVR/%gamename%" "downloads/%gamename%"
xcopy 7z.exe "downloads/%gamename%"
cd /d "downloads/%gamename%"
7z x "%%gamename%.7z"
7z x "%gamename%.zip"
echo DONE
:torrenter
torrenter.bat