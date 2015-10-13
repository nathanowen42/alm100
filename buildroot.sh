#!/bin/bash
#Author - Nathan Owen - nathanowen42@gmail.com

#files
TOP_DIR=`pwd`
BUILD_DIR=${TOP_DIR}/image_build
APP_DIR=${TOP_DIR}/alm_app
RELEASE_DIR=${TOP_DIR}/releases
ROOTFS_DIR=${BUILD_DIR}/rootfs
PROD_DIR=${TOP_DIR}/alm100

#release images
BUSYBOX_IMAGE=${RELEASE_DIR}/busybox.tar.gz

#build images
ROOTFS_IMG=${BUILD_DIR}/bin/rootfs.img

if [ ! -d "${BUILD_DIR}" ]; then
	mkdir ${BUILD_DIR}
fi

#build root filesystem
rm -rf ${ROOTFS_DIR}
mkdir ${ROOTFS_DIR} ${ROOTFS_DIR}/proc ${ROOTFS_DIR}/usr ${ROOTFS_DIR}/sys \
      ${ROOTFS_DIR}/dev ${ROOTFS_DIR}/etc ${ROOTFS_DIR}/etc/init.d ${ROOTFS_DIR}/usr/lib
mknod ${ROOTFS_DIR}/dev/ttyAM0 c 204 16
mknod ${ROOTFS_DIR}/dev/rtc0 c 254 0
ln -s rtc0 ${ROOTFS_DIR}/dev/rtc
mknod ${ROOTFS_DIR}/dev/mmcblk0 b 179 0
mknod ${ROOTFS_DIR}/dev/mmcblk0p1 b 179 1
mknod ${ROOTFS_DIR}/dev/sda b 8 0
mknod  ${ROOTFS_DIR}/dev/sda1 b 8 1
cd ${ROOTFS_DIR}
tar xfz ${RELEASE_DIR}/root/busybox.tar.gz
cd ${TOP_DIR}
#copy product specific scripts and files
cp -a ${PROD_DIR}/. ${ROOTFS_DIR}


#find . | cpio -o --format=newc > ${ROOTFS_IMG}


