#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Based on http://processors.wiki.ti.com/index.php/Linux_Core_U-Boot_User's_Guide
#With some code adopted from Robert Nelson's stable-kernel build script  - https://github.com/RobertCNelson/stable-kernel

TOPDIR=$(pwd)

source ${TOPDIR}/../../build_tools/build_paths.sh
export PATH=${TOOLCHAIN}/bin:${PATH}

KERNEL_DIR=${TOPDIR}/ti-linux-kernel
KERNEL_CONFIG=omap2plus_defconfig
RELEASE_DIR=${TOPDIR}/../../releases/
CONFIG_FILE=${TOPDIR}/configs/linux_config
CC=arm-linux-gnueabihf-
LOADADDR=0x82000000


#max number of threads to use (setting too high overloads and crashes)
CORES=10

update_repo_if_needed () {

	cd ${KERNEL_DIR}

	branch_name=$(git symbolic-ref -q HEAD)
	branch_name=${branch_name##refs/heads/}
	branch_name=${branch_name:-HEAD}
	latest_branch=$(git tag -l | grep -v rc | sort | tail -1 )

	if [ "$branch_name" != "$latest_branch" ]; then
		echo "New stable kernel available!!!"
		echo "Current release is $branch_name, latest release is $latest_branch"
		read -r -p "Would you like to update to the latest release now? [y/N] " response
		response=${response,,}    # tolower
		if [[ $response =~ ^(yes|y)$ ]]; then
			git checkout -B $latest_branch
			branch_name=$latest_branch
		fi
	fi

	cd ${TOPDIR}
}

load_defconfig () {
	cd ${KERNEL_DIR}
	make ARCH=arm CROSS_COMPILE="${CC}" distclean
	make ARCH=arm CROSS_COMPILE="${CC}" ${KERNEL_CONFIG}
	cd ${TOPDIR}
}

make_menuconfig () {
	cd ${KERNEL_DIR}
	make ARCH=arm CROSS_COMPILE="${CC}" menuconfig
	cp -v .config ${CONFIG_FILE}
	cd ${TOPDIR}
}

make_kernel () {
	#image="uImage"
	image="zImage"
	address="LOADADDR=$LOADADDR"

	cd ${KERNEL_DIR}
	#make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CC}" ${address} ${image} modules
	make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CC}" ${image} modules

	unset DTBS
	cat ${KERNEL_DIR}/arch/arm/Makefile | grep "dtbs:" >/dev/null 2>&1 && DTBS=enable

	#FIXME: Starting with v3.15-rc0
	unset has_dtbs_install
	if [ "x${DTBS}" = "x" ] ; then
		cat ${KERNEL_DIR}/arch/arm/Makefile | grep "dtbs dtbs_install:" >/dev/null 2>&1 && DTBS=enable
		if [ "x${DTBS}" = "xenable" ] ; then
			has_dtbs_install=enable
		fi
	fi

	if [ "x${DTBS}" = "xenable" ] ; then
		echo "-----------------------------"
		echo "make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CC}" dtbs"
		echo "-----------------------------"
		make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CC}" dtbs
		ls arch/arm/boot/* | grep dtb >/dev/null 2>&1 || unset DTBS
	fi

	KERNEL_UTS=$(cat ${KERNEL_DIR}/include/generated/utsrelease.h | awk '{print $3}' | sed 's/\"//g' )

	echo "Kernel uts is $KERNEL_UTS"

	if [ -f ./arch/arm/boot/${image} ] ; then
		cp -v arch/arm/boot/${image} "${RELEASE_DIR}/kernel/${KERNEL_UTS}.${image}"
	fi

	cd ${TOPDIR}
}

update_repo_if_needed

if [ "$1" == "menuconfig" ] ; then
	make_menuconfig
elif [ "$1" == "defconfig" ] ; then
	load_defconfig
else
	cp ${CONFIG_FILE} ${KERNEL_DIR}/.config
fi

make_kernel

