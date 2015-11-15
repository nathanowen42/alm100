#!/bin/bash
TOPDIR=`pwd`
QT_DIR=${TOPDIR}/qt
PATCH_DIR=${TOPDIR}/patches
TARGET_INSTALL_PATH=/opt/qt
INSTALL_DIR=${TOPDIR}/build
TOOLCHAIN=/usr/local/alm_ref/build_tools/toolchains/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf

#source ${TOPDIR}/../../build_tools/build_paths.sh

#rm -rf ${PROCESSOR_CONF_DIR}
#mkdir ${PROCESSOR_CONF_DIR}

cp -av ${PATCH_DIR}/. ${QT_DIR}/

if [ ! -d "${INSTALL_DIR}" ]; then
        mkdir ${INSTALL_DIR}
fi

#export QMAKESPEC=

#export PATH=/opt/ti-processor-sdk-linux-am335x-evm-02.00.00.00/linux-devkit/sysroots/x86_64-arago-linux/usr/bin:${QT_DIR}/qtbase/bin:${TARGET_INSTALL_PATH}/qtbase/bin:${PATH}

cd ${QT_DIR}

./configure -prefix ${TARGET_INSTALL_PATH} -embedded arm -platform qws/linux-x86-g++ -xplatform qws/linux-am335x-g++ -depths 16,24,32 -little-endian -opensource -confirm-license -no-mmx -no-3dnow -no-sse -no-sse2 -no-glib -no-cups -no-largefile -no-accessibility -no-openssl -no-gtkstyle -qt-mouse-pc -qt-mouse-linuxtp -qt-mouse-linuxinput -plugin-mouse-linuxtp -plugin-mouse-pc -fast -no-webkit

printf "make clean"
make clean -j12 1>/dev/null

printf "build qt"
make -j6
make install INSTALL_ROOT=${INSTALL_DIR}
