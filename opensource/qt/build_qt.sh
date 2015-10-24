#!/bin/bash
TOPDIR=`pwd`
QT_DIR=${TOPDIR}/qt5
CONFIG_FILE=${TOPDIR}/configs/qmake.conf
INSTALL_PATH=${TOPDIR}/build

#cp -v ${CONFIG_FILE} ${QT_DIR}/mkspecs/qws/linux-arm-g++/qmake.conf

cd ${QT_DIR}

./configure -opensource -little-endian -prefix ${INSTALL_PATH} -embedded arm -platform qws/linux-x86-g++ -xplatform qws/linux-arm-g++ -depths 16,24,32 -no-mmx -no-3dnow -no-sse -no-sse2 -no-glib -no-cups -no-largefile -no-accessibility -no-openssl -no-gtkstyle -qt-mouse-pc -qt-mouse-linuxtp -qt-mouse-linuxinput -plugin-mouse-linuxtp -plugin-mouse-pc -fast 

#printf "make clean"
#make clean -j12 1>/dev/null
make -j6
#make install
