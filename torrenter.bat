@echo off
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
aria2c --seed-time=0 -d quest2downloads %torname%
cd quest2downloads
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