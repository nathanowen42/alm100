#!/bin/bash
TOPDIR=`pwd`
QT_DIR=${TOPDIR}/qt
CONFIG_FILE=${TOPDIR}/configs/qmake.conf

cp -v ${CONFIG_FILE} ${QT_DIR}/mkspecs/qws/linux-arm-g++/qmake.conf

cd ${QT_DIR}
./configure -prefix <PATH> -embedded arm -platform qws/linux-x86-g++ -xplatform qws/linux-omap3-g++ -depths 16,24,32 -no-mmx 
-no-3dnow -no-sse -no-sse2 -no-glib -no-cups -no-largefile -no-accessibility -no-openssl -no-gtkstyle -qt-mouse-pc -qt-mouse-linuxtp 
-qt-mouse-linuxinput -plugin-mouse-linuxtp -plugin-mouse-pc -fast 
