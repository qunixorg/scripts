#!/bin/sh


source $(pwd)/commons.sh

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }
export GNULIB_SRCDIR=$(pwd)/gnulib

echo "cloning repo"
git clone https://github.com/qunixorg/gettext.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd gettext 

checkUpstream

./autogen.sh || { echo "can not bootstrap project, please check logs installation aborted" ; exit 1; }

./configure --disable-shared || { echo "can not configure project, please check logs installation aborted" ; exit 1; }

time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /tools/bin

popd
