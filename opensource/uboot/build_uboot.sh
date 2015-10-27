#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Based on http://processors.wiki.ti.com/index.php/Linux_Core_U-Boot_User's_Guide
#

TOPDIR=$(pwd)
UBOOT_DIR=ti-u-boot

source ${TOPDIR}/../../build_tools/build_paths.sh

export PATH=${TOOLCHAIN}/bin:${PATH}

update_repo () {
	cd ${TOPDIR}/${UBOOT_DIR}
	echo "Checking for repo updates"
	git pull
	cd ${TOPDIR}
}

make_uboot () {
	cd ${TOPDIR}/${UBOOT_DIR}
	rm -rf ./am335x_evm >/dev/null
	make mrproper
	make CROSS_COMPILE=arm-linux-gnueabihf- O=am335x_evm am335x_evm_config all ||
	{
		echo "Build Failed.  Script will exit..."
		exit
	}

	cd ${TOPDIR}
}


update_repo
make_uboot
