#!/bin/bash
image="uImage"
TOPDIR=$(pwd)
KERNEL_DIR=${TOPDIR}/ti-linux-kernel
RELEASE_DIR=${TOPDIR}/../../releases

cd ${KERNEL_DIR}

KERNEL_UTS=$(cat ${KERNEL_DIR}/include/generated/utsrelease.h | awk '{print $3}' | sed 's/\"//g' )

echo "Kernel uts is $KERNEL_UTS"

cp -v arch/arm/boot/${image} "${RELEASE_DIR}/kernel/${KERNEL_UTS}.${image}"

