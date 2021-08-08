#!/bin/bash

# Setting locale
sed -i 's/# en_GB/en_GB/g' /etc/locale.gen
sed -i 's/# en_US/en_US/g' /etc/locale.gen
sed -i 's/# ru_RU/ru_RU/g' /etc/locale.gen
sed -i 's/# ru_UA/ru_UA/g' /etc/locale.gen
sed -i 's/# uk_UA/uk_UA/g' /etc/locale.gen
locale-gen
update-locale "LANG=ru_UA.UTF-8"

# Setting timezone
timedatectl set-timezone Europe/Kiev

# Adding repo with latest Midnight Commander
curl -fsSL http://www.tataranovich.com/debian/gpg | apt-key add -
APT_SOURCE='deb http://www.tataranovich.com/debian buster main backports'
echo $APT_SOURCE | tee /etc/apt/sources.list.d/tataranovich.list

# Setting greater swap file
sed -i 's/#CONF_MAXSWAP/CONF_MAXSWAP/g' /etc/dphys-swapfile
sed -i -e '/CONF_SWAPSIZE=/ s/=.*/=8192/' /etc/dphys-swapfile
sed -i -e '/CONF_MAXSWAP=/ s/=.*/=8192/' /etc/dphys-swapfile
dphys-swapfile swapoff
dphys-swapfile setup
dphys-swapfile swapon

# Updating system and installing packages
apt update
apt -y install mc gpm arj dbview genisoimage links odt2txt zip git
apt -y full-upgrade
