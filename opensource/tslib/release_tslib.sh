#!/bin/bash

TOPDIR=`pwd`
TSLIB_DIR=${TOPDIR}/tslib
INSTALL_DIR=${TOPDIR}/build
RELEASE_DIR=${TOPDIR}/../../releases/tslib

rm -rf ${RELEASE_DIR}
mkdir ${RELEASE_DIR}

cp -a ${INSTALL_DIR}/. ${RELEASE_DIR}/

