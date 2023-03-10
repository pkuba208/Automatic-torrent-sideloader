@echo off
set /p gamename=Enter the full name of the game:
echo Your choice is %gamename%
pause
set /p downloaddir=downloads
echo The game will be download in the folder: %downloaddir%
mkdir "downloads/%gamename%"
7z x "downloads/%gamename%/%gamename%.7z"
7z x "downloads/%gamename%/%gamename%.zip"
pause
