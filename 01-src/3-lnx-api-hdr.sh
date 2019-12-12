#!/bin/bash
source ../commons.sh
checkVar $QUNIX_VERSION || { echo "Please set QUNIX_VERSION" ; exit 1 ; }

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

git clone https://github.com/qunixorg/linux.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd linux
git checkout qunix-v0.0.1

#sed -ie "s/EXTRAVERSION =/EXTRAVERSION = -$INSTALL_USER/g" Makefile
#yes "" | make oldconfig ||  { echo "can not copy existing kernel config, please check logs installation aborted" ; exit 1; }
#make menuconfig
make mrproper
make -s INSTALL_HDR_PATH=dest headers_install > install.log || { echo "can run make headers_install, please check logs installation aborted" ; exit 1; }

cp -rv dest/include/* /tools/include
popd
