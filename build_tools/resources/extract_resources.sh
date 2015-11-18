#!/bin/bash
TOPDIR=`pwd`

rm -rf qt4
mkdir qt4
tar xfvz qt4_env.tar.gz -C qt4
rm -f /opt/qt
ln -s ${TOPDIR}/qt4 /opt/qt 
