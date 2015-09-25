#!/bin/bash
RELEASE_TAR=`pwd`/../image_releases/rootfs/busybox.tar.gz
rm -f ${RELEASE_TAR}
cd busybox/_install
tar cfvz ${RELEASE_TAR} .
