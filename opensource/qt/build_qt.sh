#!/bin/bash
TOPDIR=`pwd`
QT_DIR=${TOPDIR}/qt5
CONFIG_FILE=${TOPDIR}/configs/qmake.conf
INSTALL_PATH=${TOPDIR}/build
PATCH_DIR=${TOPDIR}/patches

source ${TOPDIR}/../../build_tools/build_paths.sh


cp * ${PATCH_DIR} ${QT_DIR}
cp -a ${PATCH_DIR}/linux-arm-gnueabi-ti-g++ ${QT_DIR}/qtbase/mkspecs/


export QMAKESPEC=

export PATH=${TOOLCHAIN}/bin:${INSTALL_PATH}/qtbase/bin:${PATH}

cd ${QT_DIR}
./configure -prefix ${INSTALL_PATH} -release -make libs -xplatform linux-arm-gnueabi-ti-g++ -opengl es2 -confirm-license -opensource -icu -no-xcb -no-pch -make examples -verbose


#printf "make clean"
make clean -j12 1>/dev/null
make -j6
#make install
