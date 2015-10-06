#!/bin/bash
RELEASE_TAR=`pwd`/../../releases/root/busybox.tar.gz
rm -f ${RELEASE_TAR}
cd busybox/_install
tar cvfz ${RELEASE_TAR} .
