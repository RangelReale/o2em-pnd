#!/bin/sh

export HOME=$(pwd)
export LD_LIBRARY_PATH=$HOME/lib:${LD_LIBRARY_PATH:-"/usr/lib"}

DEFPATH=$HOME/
if [ ! -d $HOME/.o2em ]
then
        mkdir $HOME/.o2em
	cp config $HOME/.o2em
fi

if [ -f $HOME/.o2em/defpath ]
then
        DEFPATH=`cat $HOME/.o2em/defpath`
fi


mkdir -p $HOME/bios

while :
do
	FILE="`zenity --file-selection --title='Select a File' --filename "$DEFPATH"`"
	case $? in
	       0)
			DEFPATH="`dirname "$FILE"`/"
		        ROM="`basename "$FILE"`"

			echo -n "$DEFPATH" > $HOME/.o2em/defpath

		        $HOME/o2em -fullscreen -romdir="$DEFPATH" -s2=0 "$ROM"
		        ;;
		*)
			break
	esac
done
