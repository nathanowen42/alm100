#!/bin/bash

TOPDIR=`pwd`
TSLIB_DIR=${TOPDIR}/tslib
INSTALL_DIR=${TOPDIR}/build

source ${TOPDIR}/../../build_tools/build_paths.sh

cd ${TSLIB_DIR}
./autogen.sh
#./configure --prefix=${INSTALL_DIR} --host=arm-angstrom-linux-gnueabi
./configure --prefix=${INSTALL_DIR} --host=${TOOLCHAIN}/arm-linux-gnueabihf


rm -rf ${INSTALL_DIR}
mkdir ${INSTALL_DIR}
make clean
make
make install
