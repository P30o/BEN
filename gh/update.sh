#!/bin/sh

# إنشاء حزمة Packages وملفات الفهرسة
apt-ftparchive packages ./debs/ > ./Packages;
# sed -i -e '/^SHA/d' ./Packages;
bzip2 -c9k ./Packages > ./Packages.bz2;

# طباعة معلومات الحزمة
printf "Origin: 964's Repo\nLabel: 964\nSuite: stable\nVersion: 1.0\nCodename: 964\nArchitecture: iphoneos-arm\nComponents: main\nDescription: 964 Best Repo for all Packages! Cydia + Sileo + Installer + Zebra! & Saily.\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n";


exit 0;
