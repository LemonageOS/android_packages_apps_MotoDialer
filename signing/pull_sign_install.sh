#!/bin/bash
 
workdir="$HOME/MotoDialer/signing"
src="/sdcard/MotoDialer/app/src/main"
fileName="MotoDialer.apk"
keyStore="$workdir/lineage_apps.jks"
packageName="com.android.dialer"
mainActivity="$packageName.main.impl.MainActivity"

cd $workdir
adb wait-for-device
adb pull $src/$fileName
apksigner sign --ks=$keyStore $fileName
adb install $workdir/$fileName
adb shell am start -n $packageName/$mainActivity
