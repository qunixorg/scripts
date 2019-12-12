#!/tools/bin/bash


source $(pwd)/commons.sh

whoami && { echo "You should see I have no name but whoami return success! Please check which user you are!" ; exit 1; }
ln -sv /tools/bin/{bash,cat,chmod,dd,echo,ln,mkdir,pwd,rm,stty,touch} /bin
ln -sv /tools/bin/{env,install,perl,printf} /usr/bin
ln -sv /tools/lib/libgcc_s.so{,.1} /usr/lib
ln -sv /tools/lib/libstdc++.{a,so{,.6}} /usr/lib
ln -sv bash /bin/sh

ln -sv /proc/self/mounts /etc/mtab
