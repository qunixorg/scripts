#!/tools/bin/bash


source $(pwd)/../commons.sh

checkme "root" || { echo "Invalid user expected : root" ; exit 1; }

pushd glibc 



popd
