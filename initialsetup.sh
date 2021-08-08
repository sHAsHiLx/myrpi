#!/bin/bash
sed -i 's/# en_GB/en_GB/g' /etc/locale.gen
sed -i 's/# en_US/en_US/g' /etc/locale.gen
sed -i 's/# ru_RU/ru_RU/g' /etc/locale.gen
sed -i 's/# ru_UA/ru_UA/g' /etc/locale.gen
sed -i 's/# uk_UA/uk_UA/g' /etc/locale.gen
locale-gen
update-locale "LANG=ru_UA.UTF-8"
curl -fsSL http://www.tataranovich.com/debian/gpg | apt-key add -
APT_SOURCE='deb http://www.tataranovich.com/debian buster main backports'
echo $APT_SOURCE | tee /etc/apt/sources.list.d/tataranovich.list
apt update
apt install mc gpm arj dbview genisoimage links odt2txt zip
apt -y full-upgrade
