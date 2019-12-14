#!/tools/bin/bash


source $(pwd)/../commons.sh

checkme "root" || { echo "Invalid user expected : root" ; exit 1; }
checkVar "$MAKEFLAGS" || { echo "MAKEFLAGS not set" ; exit 1 ; }

cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib
EOF

cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf
EOF
mkdir -pv /etc/ld.so.conf.d
