#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Adds required packages, compatable with Ubuntu 15.04

#get cross compiler
apt-get -y install gcc-arm-linux-gnueabihf

#get u-boot tools (for mkimage to build kernel uImage)
apt-get -y install u-boot-tools

#install 32 bit libs
sudo apt-get -y install lib32z1
sudo apt-get -y install lib32ncurses5

#get ncurses (needed for menuconfig)
sudo apt-get -y install ncurses-dev
