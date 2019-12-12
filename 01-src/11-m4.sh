#!/bin/sh


source $(pwd)/../commons.sh

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }



echo "cloning gnulib repo"
git clone https://github.com/qunixorg/gnulib.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd gnulib

checkUpstream

export GNULIB_SRCDIR=$(pwd)

popd



echo "cloning repo"
git clone https://github.com/qunixorg/m4.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

cd m4

checkUpstream

git checkout v1.4.18

sed -i 's/AC_PREREQ/#AC_PREREQ/g' configure.ac

./bootstrap || { echo "can not run bootstrap, please check logs installation aborted" ; exit 1; }


sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

CFLAGS="-Wno-attributes -Wno-cast-align -Wimplicit-fallthrough=0 -Wabi=11" ./configure --prefix=/tools || { echo "can not configure project, please check logs installation aborted" ; exit 1; }

make clean
time make MAKEINFO=true -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }
time make MAKEINFO=true -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }
cd ../..
