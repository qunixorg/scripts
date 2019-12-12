#!/bin/sh


source $(pwd)/../commons.sh
checkVar $QUNIX_VERSION || { echo "Please set QUNIX_VERSION" ; exit 1 ; }

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

echo "cloning repo"
git clone https://github.com/qunixorg/dejagnu.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd dejagnu

git checkout qunix-v0.0.1


./configure --prefix=/tools || { echo "can not make project, please check logs installation aborted" ; exit 1; }

time make -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }
popd
