#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com

TOPDIR=$(pwd)
BUSYBOX_DIR=busybox

fetch_repo_if_needed () {
	cd ${TOPDIR}

	if [ ! -d ${BUSYBOX_DIR} ]; then 
		echo "busybox repo not found, attempting to clone from remote"
		git clone git://busybox.net/busybox.git || 
		{
			echo "Unable to clone busybox repo.  Script will exit...";
			exit;
		}

		if [ ! -d ${BUSYBOX_DIR} ]; then
			echo "${BUSYBOX_DIR} directory not found.  Script will exit..."
			exit
		else
			grep -q -F ${BUSYBOX_DIR} .gitignore || 
			{ 
				echo ${BUSYBOX_DIR} >> .gitignore
			}
		fi
	fi
}

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

	make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- install ||
	{
		echo "Install Failed.  Script will exit..."
		exit
	}

	cd ${TOPDIR}
}


fetch_repo_if_needed
update_repo
make_busybox
