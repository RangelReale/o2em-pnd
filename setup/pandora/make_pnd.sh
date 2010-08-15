#!/bin/sh

rm -Rf build

mkdir -p build

cp ../SRC/o2em build
cp PXML.xml build
cp ../SRC/o2em.png build

pnd_make.sh -p o2em.pnd -d build -x build/PXML.xml -i build/o2em.png


