#!/bin/bash
RELEASE_TAR=`pwd`/../../releases/boot
BUILD_DIR=`pwd`/ti-u-boot/am335x_emv
cp -v ${BUILD_DIR}/u-boot ${RELEASE_TAR}
cp -v ${BUILD_DIR}/spl/u-boot-spl.bin ${RELEASE_TAR} 
cp -v ${BUILD_DIR}/spl/u-boot-spl ${RELEASE_TAR} 

