#!/bin/bash
TOPDIR=`pwd`
QT_DIR=${TOPDIR}/qt5
CONFIG_FILE=${TOPDIR}/configs/qmake.conf
PATCH_DIR=${TOPDIR}/patches
TARGET_INSTALL_PATH=/opt/qt
INSTALL_DIR=${TOPDIR}/build

source ${TOPDIR}/../../build_tools/build_paths.sh


cp * ${PATCH_DIR} ${QT_DIR}
cp -a ${PATCH_DIR}/linux-arm-gnueabi-ti-g++ ${QT_DIR}/qtbase/mkspecs/

if [ ! -d "${INSTALL_DIR}" ]; then
        mkdir ${INSTALL_DIR}
fi

export QMAKESPEC=

export PATH=${TOOLCHAIN}/bin:${TARGET_INSTALL_PATH}/qtbase/bin:${PATH}

cd ${QT_DIR}
./configure -prefix ${TARGET_INSTALL_PATH} -release -make libs -xplatform linux-arm-gnueabi-ti-g++ -opengl es2 -confirm-license -opensource -icu -no-xcb -no-pch -make examples -verbose


#printf "make clean"
make clean -j12 1>/dev/null
make -j6
make install INSTALL_ROOT=${INSTALL_DIR}
