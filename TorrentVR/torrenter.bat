@echo off
setlocal enabledelayedexpansion

:menu
echo.
echo 1. Wireless adb
echo 2. Adb over USB
echo 3. Exit
echo.
set /p choice=Enter your choice: 

if "%choice%"=="1" (
    echo You chose option 1
    echo Please connect your quest 2 to your pc using a usb cable
    goto wadb
    pause
    goto main
)

if "%choice%"=="2" (
    echo You chose option 2
    adb usb
    pause
    goto main
)

if "%choice%"=="3" (
    exit
)


:wadb
REM It took me wayy too much time to port this to Windows. Fuck Windows
REM I'm able to do this much faster and with fewer lines on linux...
rem Get device IP
FOR /F "tokens=2 delims= " %%i in ('adb shell ip -f inet addr show wlan0 ^| findstr "inet"') do set IP_ADDRESS=%%i

echo [DEBUG] with /24 is !IP_ADDRESS!
set IP2=%IP_ADDRESS:~0,-3%

echo [DEBUG] without /24 !IP2!
pause
adb tcpip 5555
adb connect !IP2!:5555
echo Now you can disconnect your quest 2 from your computer
pause
:main
REM this is some grade A fuckery here.
REM This is a very clunky workaround, but it works
REM It saves the user input from the popup to a temp file, then reads it and sets it as a variable
REM Integrating VBScript into batch is a hell of a chore
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Torrenter, what directory is the script stored in?', 'Torrenter')}" > %TEMP%\out2.tmp
set /p scriptdir=<%TEMP%\out2.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %scriptdir%', 'Torrenter');}"
powershell -Command %msgBoxArgs%
echo You selected %scriptdir%
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Torrenter, what torrent file shall I download?', 'Torrenter')}" > %TEMP%\out3.tmp
set /p torname=<%TEMP%\out3.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %torname%', 'Torrenter');}"
powershell -Command %msgBoxArgs%
echo You selected %torname%
aria2c --seed-time=0 -d downloads %torname%
cd downloads
dir
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('What is the name of the download directory containing the OBB file directory?', 'Torrenter')}" > %TEMP%\out4.tmp
set /p download=<%TEMP%\out4.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %download%', 'Torrenter');}"
powershell -Command %msgBoxArgs%
echo You selected %download%
cd %download%
dir
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('What is the name of the apk file?', 'Torrenter')}" > %TEMP%\out5.tmp
set /p apk=<%TEMP%\out5.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %apk%', 'Torrenter');}"
powershell -Command %msgBoxArgs%
echo You selected %apk%
dir
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Which one is the OBB folder? If there is no obb folder, type in no', 'Torrenter')}" > %TEMP%\out6.tmp
set /p OBB=<%TEMP%\out6.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have entered: %OBB%', 'Torrenter');}"
powershell -Command %msgBoxArgs%
echo You selected %OBB%
"%scriptdir%/adb.exe" install "%apk%"
echo pushing OBB directory to your headset
"%scriptdir%/adb.exe" push %OBB% /sdcard/Android/obb/
echo SUCCESS
pause
