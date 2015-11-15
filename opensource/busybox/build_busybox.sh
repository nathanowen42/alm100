#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com

TOPDIR=$(pwd)
BUSYBOX_DIR=busybox

source ${TOPDIR}/../../build_tools/build_paths.sh

update_repo () {
	cd ${TOPDIR}/${BUSYBOX_DIR}
	echo "Checking for repo updates"
	git pull
	cd ${TOPDIR}
}

make_busybox () {
	cd ${TOPDIR}/${BUSYBOX_DIR}
	rm -rf ./_install >/dev/null
	make mrproper
	cp -vf ${TOPDIR}/configs/busybox .config
	make -j4 ||
	{
		echo "Build Failed.  Script will exit..."
		exit
	}

	make -j4 ARCH=arm CROSS_COMPILE=${TOOLCHAIN}/arm-linux-gnueabihf- install ||
	{
		echo "Install Failed.  Script will exit..."
		exit
	}

	cd ${TOPDIR}
}

update_repo
make_busybox
