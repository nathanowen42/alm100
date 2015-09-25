#!/bin/bash
BUILD_DIR=`pwd`
SRC_DIR=${BUILD_DIR}/../src
ROOT_DIR=${BUILD_DIR}/rootfs
rm -rf rootfs
mkdir rootfs rootfs/proc rootfs/usr rootfs/sys rootfs/dev rootfs/etc rootfs/etc/init.d rootfs/usr/lib
cd ${SRC_DIR}/busybox
make clean
make -j4
make -j4 install
cp -av ./_install/. ${ROOT_DIR}
cd ${BUILD_DIR}
#find . | cpio -o --format=newc > ../../init/rootfs.img


