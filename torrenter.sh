#!/bin/bash
# download torrent
echo '
 ___________  ______     _______    _______    _______  _____  ___  ___________  _______   _______
("     _   ")/    " \   /"      \  /"      \  /"     "|(\"   \|"  \("     _   ")/"     "| /"      \
 )__/  \\__/// ____  \ |:        ||:        |(: ______)|.\\   \    |)__/  \\__/(: ______)|:        |
    \\_ /  /  /    ) :)|_____/   )|_____/   ) \/    |  |: \.   \\  |   \\_ /    \/    |  |_____/   )
    |.  | (: (____/ //  //      /  //      /  // ___)_ |.  \    \. |   |.  |    // ___)_  //      /
    \:  |  \        /  |:  __   \ |:  __   \ (:      "||    \    \ |   \:  |   (:      "||:  __   \
     \__|   \"_____/   |__|  \___)|__|  \___) \_______) \___|\____\)    \__|    \_______)|__|  \___)
'
echo FUCK COPYRIGHT, pkuba208
echo Hello, what magnet link shall I download? Insert magnet link
read magnet
aria2c --seed-time=0 -d quest2downloads $magnet 
cd quest2downloads
ls
echo What is the name of the download directory containing the OBB file directory?
read download
echo "$download"
cd "$download"
echo Sideloading apk...
adb install *.apk
echo Apk sideloading Complete
echo which one is the OBB folder?
ls
read OBB
echo Copying OBB files...
echo obb directory is named $OBB
echo pushing OBB directory to your headset
adb push $OBB /sdcard/Android/obb/
echo SUCCESS
