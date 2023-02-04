#!/bin/bash
# download torrent
adb disconnect
adb usb
cat logo.txt
echo FUCK COPYRIGHT, pkuba208
echo -e "\nFirst of all: Do you want to use adb over USB or wireless adb?"
echo -e "\n1 - Adb over USB"
echo -e "\n2 - Wireless adb"
read selectadb
if [ "$selectadb" -eq 2 ]; then
    read -n 1 -s -p "Plug in your quest via USB to set it to wireless adb mode and pull its IP. After you've plugged it in press any key to continue"
    IP_ADDRESS=$(adb shell ip -f inet addr show wlan0 | grep -oE 'inet [^ ]+')
echo -e "\nDEBUG FOR DEVS unmodified ip variable $IP_ADDRESS"
IP=`echo "$IP_ADDRESS" | awk -F'/' '{print $1}' | awk '{print $2}'`
echo -e "\nDEBUG FOR DEVS modded variable $IP"
echo -e "\nDEBUG FOR DEVS modded variable $IP"
    adb tcpip 5555
    read -n 1 -s -p "\nNow unplug your device and press any key to continue"
    echo -e  "\nYour device ip is $IP "
    adb connect $IP:5555
    fi
    

echo Hello, what magnet link shall I download? Insert magnet link
read magnet
aria2c --seed-time=0 -d quest2downloads $magnet 
cd quest2downloads
ls
echo -e "\nWhat is the name of the download directory containing the OBB 
file directory?"
read download
echo "$download"
cd "$download"
ls
echo -e "\nWhat is the name of the apk file?"
read apkname
file="$apkname"
newfile=$(echo $file | tr -d ' ')
mv "$file" "$newfile"
adb push "$newfile" /data/local/tmp
adb shell pm install "/data/local/tmp/$newfile"
echo Apk sideloading Complete
echo -e "\nWhich one is the OBB folder?"
ls
read OBB
echo -e "\nCopying OBB files..."
echo -e "\nobb directory is named $OBB"
echo -e "\npushing OBB directory to your headset"
adb push $OBB /sdcard/Android/obb/
echo SUCCESS
