#!/bin/bash

TOPDIR=`pwd`
TSLIB_DIR=${TOPDIR}/tslib
INSTALL_DIR=${TOPDIR}/build
RELEASE_DIR=${TOPDIR}/../../releases/tslib

rm -rf ${RELEASE_DIR}
mkdir ${RELEASE_DIR}

tar cfvz ${RELEASE_DIR}/tslib.tar.gz ${INSTALL_DIR}/.

