#!/bin/sh

rm -Rf build

mkdir -p build
mkdir -p build/lib

cp ../../SRC/o2em build
cp ../../SRC/o2em.png build
cp ../../Docs/LICENSE.TXT build
cp ../../Docs/O2EM.TXT build
cp PXML.xml build
cp run.sh build

cp $SDK_PATH_TARGET/lib/liballeg.so.4.4 build/lib

pnd_make.sh -p o2em.pnd -d build -x build/PXML.xml -i build/o2em.png


