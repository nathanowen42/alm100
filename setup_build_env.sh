#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Adds required packages, compatable with Ubuntu 15.04

sudo apt-get update

#get cross compiler
sudo apt-get -y install gcc-arm-linux-gnueabihf

#get u-boot tools (for mkimage to build kernel uImage)
sudo apt-get -y install u-boot-tools

#install 32 bit libs
sudo apt-get -y install lib32z1
sudo apt-get -y install lib32ncurses5

#get ncurses (needed for menuconfig)
sudo apt-get -y install ncurses-dev

#for busybox
sudo apt-get install gcc-arm-linux-gnueabi
apt-get install gawk

#for qt
sudo apt-get -y build-dep qt5-default
sudo apt-get -y install build-essential perl python git
sudo apt-get -y install "^libxcb.*" libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
sudo apt-get -y install libcap-dev libbz2-dev libgcrypt11-dev libpci-dev libnss3-dev build-essential libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdrm-dev libfontconfig1-dev libxtst-dev libasound2-dev gperf libcups2-dev libpulse-dev libudev-dev libssl-dev flex bison ruby

#for tslib
sudo apt-get install autoconf
sudo apt-get install libtool
