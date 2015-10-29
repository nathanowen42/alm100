#!/bin/bash

TOPDIR=`pwd`
REL_DIR=${TOPDIR}/../../releases/app

if [ ! -d "${REL_DIR}" ]; then
	mkdir ${REL_DIR}
fi

if [ ! -d "${REL_DIR}/opt" ]; then
        mkdir ${REL_DIR}/opt
fi

cp -v alm_app ${REL_DIR}/opt/alm_app
