#!/bin/bash
# download torrent
cat logo.txt
echo FUCK COPYRIGHT, pkuba208
echo -e "\nFirst of all: Do you want to use adb over USB or wireless adb?"
echo -e "\n1 - Adb over USB"
echo -e "\n2 - Wireless adb"
read selectadb
if [ "$selectadb" -eq 2 ]; then
    read -n 1 -s -p "Plug in your quest via USB to set it to wireless adb mode and pull its IP. After you've plugged it in press any key to continue"
    IP_ADDRESS=$(adb shell ip -f inet addr show wlan0 | grep -Po 'inet \K[\d.]+')
    adb tcpip 5555
    read -n 1 -s -p "Now unplug your device and press any key to continue"
    echo -e  "\nYour device ip is $IP_ADDRESS"
    adb connect $IP_ADDRESS:5555
    fi
magnet=$(zenity --entry --title "Enter the magnet link" --text "Please enter the magnet link:")

if [[ -n "$magnet" ]]; then
    echo "Magnet is $name!"
else
    echo "You didn't enter a magnet link."
fi

aria2c --seed-time=0 -d quest2downloads $magnet 
cd quest2downloads
ls
download=$(zenity --entry --title "Enter Downloaded directory" --text "Please enter the name of the downloaded directory:")

if [[ -n "$download" ]]; then
    echo "Download dir is $download"
else
    echo "You didn't enter anything"
fi

echo "$download"
cd "$download"
ls
apkname=$(zenity --entry --title "Enter the name of the apk file" --text "Please enter the apk file name:")

if [[ -n "$name" ]]; then
    echo "Apk name is $name"
else
    echo "You didn't enter anything."
fi

file="$apkname"
newfile=$(echo $file | tr -d ' ')
mv "$file" "$newfile"
adb push "$newfile" /data/local/tmp
adb shell pm install "/data/local/tmp/$newfile"
echo Apk sideloading Complete
ls
OBB=$(zenity --entry --title "Enter the name of the obb files" --text "Please enter the name of the OBB folder:")

if [[ -n "$OBB" ]]; then
    echo "Obb folder is $OBB"
else
    echo "You didn't enter anything."
fi

echo Copying OBB files...
echo obb directory is named $OBB
echo pushing OBB directory to your headset
adb push $OBB /sdcard/Android/obb/
echo SUCCESS
