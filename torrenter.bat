@echo off
echo FUCK COPYRIGHT, pkuba208
echo Before we start in the windows version you have to download the torrent file manually and paste it into the directory where the script is contained, because of a bug in aria2c's windows version 
echo Hello, what directory is the script stored in?
set /p dir=
echo The directory you have entered is %dir%
pause
dir
echo Hello, what torrent file shall I download? Insert torrent file.
set /p magnet=
aria2c --seed-time=0 -d quest2downloads %magnet% 
cd quest2downloads
dir
echo What is the name of the download directory containing the OBB file directory?
set /p download=
echo %download%
cd %download%
echo Sideloading apk...
dir
echo What is the name of the apk file?
set /p apk=
"%dir%/adb.exe" install %apk%
echo Apk sideloading Complete
echo which one is the OBB folder?
dir
set /p OBB=
echo Copying OBB files...
echo obb directory is named %OBB%
echo pushing OBB directory to your headset
"%dir%/adb.exe" push %OBB% /sdcard/Android/obb/
echo SUCCESS
