#!/bin/bash

function replace_file()
{
	my_string=`ls $1/*.c $1/*.h`
	list=($(echo $my_string | tr ";" "\n"))

	for i in "${list[@]}"
	do
		tail -n +14 $i > tmp.gmadec && mv tmp.gmadec $i && vim $i -c Stdheader -c x
	done
}

if [ $1 ]
then
        echo "Les headers des .c du repertoires $1 vont etre remplacer !"
		replace_file "$1"
else
        echo "usage: change_header.sh folder"
fi
