#!/bin/bash
#Written by Nathan Owen - nathanowen42@gmail.com
#Based on http://processors.wiki.ti.com/index.php/Linux_Core_U-Boot_User's_Guide
#

TOPDIR=$(pwd)
KERNEL_DIR=linux-stable
GIT_REPO=https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
KERNEL_CONFIG_FILE=tisdk_am335x-evm_defconfig

echo topdir is $TOPDIR
if [ ! -d $KERNEL_DIR ]; then 
	echo "kernel repo not found, attempting to clone from remote"
	git clone $GIT_REPO $KERNEL_DIR || 
	{
		echo "Unable to clone ti uboot repo.  Script will exit...";
		exit;
	}

	if [ ! -d $KERNEL_DIR ]; then
		echo "$KERNEL_DIR directory not found.  Script will exit..."
		exit
	else
		grep -q -F $KERNEL_DIR .gitignore >/dev/null || 
		{ 
			echo $KERNEL_DIR >> .gitignore
		}

		cd $KERNEL_DIR
		latest_branch=$(git tag -l | grep -v rc | sort | tail -1 )
		git checkout -B $latest_branch
		cd ..
	fi
fi

cd $KERNEL_DIR

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

cp -f $TOPDIR/configurations/$KERNEL_CONFIG_FILE ./arch/arm/configs/$KERNEL_CONFIG_FILE
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mrproper
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- $KERNEL_CONFIG_FILE


#make mrproper
#{
#	echo "Build Failed.  Script will exit..."
#	exit
#}



