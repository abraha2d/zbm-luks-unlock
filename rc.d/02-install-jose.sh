#!/bin/sh

set -e

JOSE_GH_REPO=https://github.com/latchset/jose
JOSE_VER=14
TMP_DIR=/tmp/jose-build

rm -rf $TMP_DIR
mkdir $TMP_DIR
cd $TMP_DIR

curl -LO $JOSE_GH_REPO/releases/download/v$JOSE_VER/jose-$JOSE_VER.tar.xz

tar xf jose-$JOSE_VER.tar.xz
cd jose-$JOSE_VER

mkdir build
cd build

meson setup .. --prefix=/usr
ninja
ninja install
