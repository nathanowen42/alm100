#!/bin/bash
TOP_DIR=`pwd`
RELEASE_DIR=${TOP_DIR}/../../releases/boot/
BUILD_DIR=${TOP_DIR}/ti-u-boot/am335x_evm/
cp -v ${TOP_DIR}/uEnv.txt ${RELEASE_DIR}
cp -v ${BUILD_DIR}/MLO ${RELEASE_DIR}
cp -v ${BUILD_DIR}/u-boot ${RELEASE_DIR}
cp -v ${BUILD_DIR}/u-boot.img ${RELEASE_DIR}
cp -v ${BUILD_DIR}/spl/u-boot-spl.bin ${RELEASE_DIR} 
cp -v ${BUILD_DIR}/spl/u-boot-spl ${RELEASE_DIR} 

