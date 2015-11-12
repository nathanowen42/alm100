#!/bin/bash
TOPDIR=`pwd`
QT_DIR=${TOPDIR}/qt5
CONFIG_FILE=${TOPDIR}/configs/qmake.conf
PATCH_DIR=${TOPDIR}/patches
TARGET_INSTALL_PATH=/opt/qt
INSTALL_DIR=${TOPDIR}/build
PROCESSOR_CONF_DIR=${QT_DIR}/qtbase/mkspecs/linux-arm-gnueabi-ti-g++/
TSLIB_DIR=${QT_DIR}/qtbase/src/plugins/generic/tslib/

source ${TOPDIR}/../../build_tools/build_paths.sh

rm -rf ${PROCESSOR_CONF_DIR}
mkdir ${PROCESSOR_CONF_DIR}

cp -v ${PATCH_DIR}/* ${QT_DIR}/
cp -va ${PATCH_DIR}/linux-arm-gnueabi-ti-g++/. ${PROCESSOR_CONF_DIR}/
cp -v ${CONFIG_FILE} ${PROCESSOR_CONF_DIR}/

if [ ! -d "${INSTALL_DIR}" ]; then
        mkdir ${INSTALL_DIR}
fi

export QMAKESPEC=

export PATH=${TOOLCHAIN}/bin:${TARGET_INSTALL_PATH}/qtbase/bin:${PATH}

cd ${QT_DIR}
./configure -prefix ${TARGET_INSTALL_PATH} -release -make libs -xplatform linux-arm-gnueabi-ti-g++ -opengl es2 -confirm-license -opensource -icu -no-xcb -no-pch -make examples -verbose

printf "make clean"
make clean -j12 1>/dev/null

#build tslib
printf "build tslib"
cd ${TSLIB_DIR}
make clean
make
make install
cd ${QT_DIR}

printf "build qt5"
make -j6
make install INSTALL_ROOT=${INSTALL_DIR}
