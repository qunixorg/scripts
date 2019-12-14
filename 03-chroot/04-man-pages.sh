#!/tools/bin/bash


source $(pwd)/../commons.sh

checkme "root" || { echo "Invalid user expected : root" ; exit 1; }
checkVar "$MAKEFLAGS" || { echo "MAKEFLAGS not set" ; exit 1 ; }

pushd ../01-src/man-pages

time make -s install > make.log || { echo "Can not install please check logs" ; exit 1; }

popd
