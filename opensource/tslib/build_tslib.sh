#!/bin/bash

TOPDIR=`pwd`
TSLIB_DIR=${TOPDIR}/tslib
INSTALL_DIR=${TOPDIR}/build

source ${TOPDIR}/../../build_tools/build_paths.sh

export PATH=${TOOLCHAIN}/bin:${PATH}

cd ${TSLIB_DIR}
./autogen.sh
./configure --prefix=${INSTALL_DIR} --host=arm-angstrom-linux-gnueabi


rm -rf ${INSTALL_DIR}
mkdir ${INSTALL_DIR}
make
make install
