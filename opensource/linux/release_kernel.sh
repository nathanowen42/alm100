#!/bin/bash
image="zImage"
TOPDIR=$(pwd)
KERNEL_DIR=${TOPDIR}/ti-linux-kernel
RELEASE_DIR=${TOPDIR}/../../releases
DTB_FILE=${KERNEL_DIR}/arch/arm/boot/dts/am335x-boneblack.dtb

cd ${KERNEL_DIR}

KERNEL_UTS=$(cat ${KERNEL_DIR}/include/generated/utsrelease.h | awk '{print $3}' | sed 's/\"//g' )

echo "Kernel uts is $KERNEL_UTS"

cp -v arch/arm/boot/${image} "${RELEASE_DIR}/kernel/${KERNEL_UTS}.${image}"
cp -v ${DTB_FILE} ${RELEASE_DIR}/dtb/
