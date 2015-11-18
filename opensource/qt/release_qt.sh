#!/bin/bash
TOP_DIR=`pwd`
RELEASE_DIR=${TOP_DIR}/../../releases/qt
BUILD_DIR=${TOP_DIR}/build
RESOURCE_TAR=${TOP_DIR}/../../build_tools/resources/qt4_env.tar.gz
rm -rf ${RELEASE_DIR}
mkdir ${RELEASE_DIR}

cd ${BUILD_DIR}
tar cfvz ${RELEASE_DIR}/qt4.tar.gz opt/qt/bin opt/qt/imports opt/qt/lib opt/qt/translations
cd ${BUILD_DIR}/opt/qt
tar cfvz ${RESOURCE_TAR} .
cd ${TOP_DIR}

