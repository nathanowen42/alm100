#!/bin/bash
TOP_DIR=`pwd`
RELEASE_DIR=${TOP_DIR}/../../releases/qt
BUILD_DIR=${TOP_DIR}/build/opt/qt
rm -rf ${RELEASE_DIR}
cp -av ${BUILD_DIR}/. ${RELEASE_DIR}/

