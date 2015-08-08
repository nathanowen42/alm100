#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Based on http://processors.wiki.ti.com/index.php/Linux_Core_U-Boot_User's_Guide
#

UBOOT_DIR=ti-u-boot

if [ ! -d $UBOOT_DIR ]; then 
	echo "ti-u-boot repo not found, attempting to clone from remote"
	git clone git://git.ti.com/ti-u-boot/ti-u-boot.git || 
	{
		echo "Unable to clone ti uboot repo.  Script will exit...";
		exit;
	}

	if [ ! -d $UBOOT_DIR ]; then
		echo "$UBOOT_DIR directory not found.  Script will exit..."
		exit
	else
		grep -q -F $UBOOT_DIR .gitignore || 
		{ 
			echo $UBOOT_DIR >> .gitignore
		}
	fi
fi

cd $UBOOT_DIR

echo "Checking for repo updates"
git pull

rm -rf ./am335x_evm >/dev/null
make mrproper
make CROSS_COMPILE=arm-linux-gnueabihf- O=am335x_evm am335x_evm_config all ||
{
	echo "Build Failed.  Script will exit..."
	exit
}



