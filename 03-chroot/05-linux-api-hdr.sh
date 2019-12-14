#!/tools/bin/bash


source $(pwd)/../commons.sh

checkme "root" || { echo "Invalid user expected : root" ; exit 1; }
checkVar "$MAKEFLAGS" || { echo "MAKEFLAGS not set" ; exit 1 ; }

pushd ../01-src/linux

make INSTALL_HDR_PATH=dest headers_install || { echo "Can not install please check logs" ; exit 1; }

find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

popd
