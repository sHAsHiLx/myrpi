#!/bin/bash
versions=($(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' https://github.com/hestiacp/hestiacp|awk '{ print $2 }'|sed 's/refs\/tags\///g'))
echo "Latest version of HestiaCP is ${versions[-1]}"
echo "Cloning..."
git clone -b ${versions[-1]} https://github.com/hestiacp/hestiacp hestiacp-${versions[-1]}
cd hestiacp-${versions[-1]}/src
./hst_autocompile.sh --all --noinstall --keepbuild '~localsrc'
cd ../install/
bash hst-install-debian.sh --with-debs /tmp/hestiacp-src/deb/
