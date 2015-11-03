#!/bin/bash
#Author - Nathan Owen - nathanowen42@gmail.com

#files
TOP_DIR=`pwd`
BUILD_DIR=${TOP_DIR}/image_build
RELEASE_DIR=${TOP_DIR}/releases
APP_DIR=${RELEASE_DIR}/app
ROOTFS_DIR=${BUILD_DIR}/rootfs
PROD_DIR=${TOP_DIR}/alm100
QT_REL_DIR=${RELEASE_DIR}/qt
QT_INSTALL_DIR=${ROOTFS_DIR}/opt/qt

#release images
BUSYBOX_IMAGE=${RELEASE_DIR}/busybox.tar.gz

#build images
ROOTFS_IMG=${BUILD_DIR}/bin/rootfs.img

if [ ! -d "${BUILD_DIR}" ]; then
	mkdir ${BUILD_DIR}
fi

if [ ! -d "${BUILD_DIR}/bin" ]; then
	mkdir ${BUILD_DIR}/bin
fi

#build root filesystem
rm -rf ${ROOTFS_DIR}
mkdir ${ROOTFS_DIR} ${ROOTFS_DIR}/proc ${ROOTFS_DIR}/usr ${ROOTFS_DIR}/opt ${ROOTFS_DIR}/sys \
      ${ROOTFS_DIR}/dev ${ROOTFS_DIR}/etc ${ROOTFS_DIR}/home ${ROOTFS_DIR}/etc/init.d \
      ${ROOTFS_DIR}/usr/lib ${ROOTFS_DIR}/home/root
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

#Copy QT resources
mkdir ${QT_INSTALL_DIR} ${QT_INSTALL_DIR}/bin ${QT_INSTALL_DIR}/lib ${QT_INSTALL_DIR}/plugins
cp -a ${QT_REL_DIR}/lib/. ${QT_INSTALL_DIR}/lib/
cp -a ${QT_REL_DIR}/bin/. ${QT_INSTALL_DIR}/bin/
cp -a ${QT_REL_DIR}/plugins/. ${QT_INSTALL_DIR}/plugins/

#copy app files
cp -a ${APP_DIR}/. ${ROOTFS_DIR}

rm -f ${ROOTFS_IMG}
cd ${ROOTFS_DIR}
find . | cpio -o --format=newc > ${ROOTFS_IMG}


