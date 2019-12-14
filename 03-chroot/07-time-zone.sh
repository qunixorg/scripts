#!/tools/bin/bash


source $(pwd)/../commons.sh

checkme "root" || { echo "Invalid user expected : root" ; exit 1; }
checkVar "$MAKEFLAGS" || { echo "MAKEFLAGS not set" ; exit 1 ; }

pushd ../01-src/iana-timezones

ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}
for tz in etcetera southamerica northamerica europe africa antarctica \
 asia australasia backward pacificnew systemv; do
 zic -L /dev/null -d $ZONEINFO ${tz}
 zic -L /dev/null -d $ZONEINFO/posix ${tz}
 zic -L leapseconds -d $ZONEINFO/right ${tz}
done
cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO

ln -sfv /usr/share/zoneinfo/$(cat /.timezone) /etc/localtime


popd
