#!/bin/sh

CURRENT_DIR=$(pwd)
for dir in $CURRENT_DIR/*/
do
	folder=${dir%*/}
	echo "processing $folder"

	git_folder=$folder/.git
	if [ -d $git_folder ]; then
		git --git-dir $git_folder push --set-upstream origin master --follow-tags --tags 
	fi
done
