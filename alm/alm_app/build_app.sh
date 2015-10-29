#!/bin/bash
TOPDIR=`pwd`
#CONFIG_FILE=${TOPDIR}/configs/qmake.conf

source ${TOPDIR}/../../build_tools/build_paths.sh

export QMAKESPEC=

export PATH=${TOOLCHAIN}/bin:${PATH}

./configure -embedded arm -xplatform qws/linux-arm-g++

#printf "make clean"
rm *.o
qmake
make -j6
