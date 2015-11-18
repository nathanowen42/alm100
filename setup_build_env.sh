#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Adds required packages, compatable with Ubuntu 15.04

TOPDIR=`pwd`

AMIROOT=`whoami | awk {'print $1'}`
if [ "$AMIROOT" != "root" ] ; then

	echo "	Error: Script must be run with root permissions "
	exit
fi

rm -f /usr/local/alm_ref
ln -s ${TOPDIR} /usr/local/alm_ref

apt-get update

#get cross compiler
apt-get -y install gcc-arm-linux-gnueabihf

#get u-boot tools (for mkimage to build kernel uImage)
apt-get -y install u-boot-tools

#install 32 bit libs
apt-get -y install lib32z1
apt-get -y install lib32ncurses5

#get ncurses (needed for menuconfig)
apt-get -y install ncurses-dev

#for busybox
apt-get -y install gcc-arm-linux-gnueabi
apt-get -y install gawk

#for qt
apt-get install qt-sdk
apt-get -y build-dep qt5-default
apt-get -y install build-essential perl python git
apt-get -y install "^libxcb.*" libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
apt-get -y install libcap-dev libbz2-dev libgcrypt11-dev libpci-dev libnss3-dev build-essential libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdrm-dev libfontconfig1-dev libxtst-dev libasound2-dev gperf libcups2-dev libpulse-dev libudev-dev libssl-dev flex bison ruby

#for tslib
apt-get -y install autoconf
apt-get -y install libtool

#extract libraries
cd ${TOPDIR}/build_tools/toolchains/
./fetch_toolchains.sh

#extract resources
cd ${TOPDIR}/build_tools/resources/
./extract_resources.sh

cd ${TOPDIR}

#init git submodules
git submodule update --init --recursive



