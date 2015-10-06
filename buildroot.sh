#!/bin/bash
#Author - Nathan Owen - nathanowen42@gmail.com

#files
TOP_DIR=`pwd`
BUILD_DIR=${TOP_DIR}/image_build
RELEASE_DIR=${TOP_DIR}/releases
ROOTFS_DIR=${BUILD_DIR}/rootfs

#release images
BUSYBOX_IMAGE=${RELEASE_DIR}/busybox.tar.gz

#build images
ROOTFS_IMG=${BUILD_DIR}/bin/rootfs.img

#build root filesystem
rm -rf ${ROOTFS_DIR}
mkdir ${ROOTFS_DIR}  ${ROOTFS_DIR}/proc ${ROOTFS_DIR}/usr ${ROOTFS_DIR}/sys \
      ${ROOTFS_DIR}/dev ${ROOTFS_DIR}/etc ${ROOTFS_DIR}/etc/init.d ${ROOTFS_DIR}/usr/lib
cd ${ROOTFS_DIR}
tar xfz ${RELEASE_DIR}/rootfs/busybox.tar.gz
find . | cpio -o --format=newc > ${ROOTFS_IMG}


