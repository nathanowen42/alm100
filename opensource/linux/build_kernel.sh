#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Based on http://processors.wiki.ti.com/index.php/Linux_Core_U-Boot_User's_Guide
#With some code adopted from Robert Nelson's stable-kernel build script  - https://github.com/RobertCNelson/stable-kernel

TOPDIR=$(pwd)
#KERNEL_DIR=linux-stable
#GIT_REPO=https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
KERNEL_DIR=ti-linux-kernel
GIT_REPO=git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
KERNEL_CONFIG=omap2plus_defconfig
CC=arm-linux-gnueabihf-
LOADADDR=0x80008000

#max number of threads to use (setting too high overloads and crashes)
CORES=10

fetch_repo_if_needed () {

	cd ${TOPDIR}

	if [ ! -d ${KERNEL_DIR} ]; then 
		echo "kernel repo not found, attempting to clone from remote"
		git clone ${GIT_REPO} ${KERNEL_DIR} || 
		{
			echo "Unable to clone ti uboot repo.  Script will exit...";
			exit;
		}

		if [ ! -d ${KERNEL_DIR} ]; then
			echo "${KERNEL_DIR} directory not found.  Script will exit..."
			exit
		else
			grep -q -F ${KERNEL_DIR} .gitignore >/dev/null || 
			{ 
				echo ${KERNEL_DIR} >> .gitignore
			}

			cd ${KERNEL_DIR}
			latest_branch=$(git tag -l | grep -v rc | sort | tail -1 )
			git checkout -B ${latest_branch}
			cd ..
		fi
	fi

	cd ${TOPDIR}
}

update_repo_if_needed () {

	cd ${TOPDIR}/${KERNEL_DIR}

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
	cd ${TOPDIR}/${KERNEL_DIR}
	make ARCH=arm CROSS_COMPILE="${CC}" distclean
	make ARCH=arm CROSS_COMPILE="${CC}" ${KERNEL_CONFIG}
	cd ${TOPDIR}
}

make_menuconfig () {
	cd ${TOPDIR}/${KERNEL_DIR}
	make ARCH=arm CROSS_COMPILE="${CC}" menuconfig
	cp -v .config ${TOPDIR}/patches/defconfig
	cd ${TOPDIR}
}

make_kernel () {
	image="uImage"
	address="LOADADDR=$LOADADDR"

	cd ${TOPDIR}/${KERNEL_DIR}
	make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CC}" ${address} ${image} modules

	unset DTBS
	cat ${TOPDIR}/${KERNEL_DIR}/arch/arm/Makefile | grep "dtbs:" >/dev/null 2>&1 && DTBS=enable

	#FIXME: Starting with v3.15-rc0
	unset has_dtbs_install
	if [ "x${DTBS}" = "x" ] ; then
		cat ${TOPDIR}/${KERNEL_DIR}/arch/arm/Makefile | grep "dtbs dtbs_install:" >/dev/null 2>&1 && DTBS=enable
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

	KERNEL_UTS=$(cat ${TOPDIR}/${KERNEL_DIR}/include/generated/utsrelease.h | awk '{print $3}' | sed 's/\"//g' )

	echo "Kernel uts is $KERNEL_UTS"

	if [ -f "${TOPDIR}/deploy/${KERNEL_UTS}.${image}" ] ; then
		rm -rf "${TOPDIR}/deploy/${KERNEL_UTS}.${image}" || true
		rm -rf "${TOPDIR}/deploy/config-${KERNEL_UTS}" || true
	fi

	if [ -f ./arch/arm/boot/${image} ] ; then
		cp -v arch/arm/boot/${image} "${TOPDIR}/deploy/${KERNEL_UTS}.${image}"
		cp -v .config "${TOPDIR}/deploy/config-${KERNEL_UTS}"
	fi

	cd ${TOPDIR}
}

fetch_repo_if_needed
update_repo_if_needed

if [ "$1" == "menuconfig" ] ; then
	make_menuconfig
elif [ "$1" == "defconfig" ] ; then
	load_defconfig
else
	cp ${TOPDIR}/patches/defconfig ${TOPDIR}/$KERNEL_DIR/.config
fi

make_kernel

#cp -f $TOPDIR/configurations/$KERNEL_CONFIG_FILE ./arch/arm/configs/$KERNEL_CONFIG_FILE
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mrproper
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- $KERNEL_CONFIG_FILE
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-


