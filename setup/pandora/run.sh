#!/bin/sh

export HOME=$(pwd)
export LD_LIBRARY_PATH=$HOME/lib:${LD_LIBRARY_PATH:-"/usr/lib"}

mkdir -p $HOME/roms
mkdir -p $HOME/bios

FILE="`zenity --file-selection --title='Select a File' --filename=$HOME/roms`"
case $? in
       0)
                ROM="`basename "$FILE"`"
                $HOME/o2em -fullscreen -s1=UP,DOWN,LEFT,RIGHT,END -s2=UP,DOWN,LEFT,RIGHT,END "$ROM"
                ;;
esac

