#!/bin/sh

set -e

LUKSMETA_GH_REPO=https://github.com/latchset/luksmeta
LUKSMETA_VER=9
TMP_DIR=/tmp/luksmeta-build

rm -rf $TMP_DIR
mkdir $TMP_DIR
cd $TMP_DIR

curl -LO $LUKSMETA_GH_REPO/releases/download/v$LUKSMETA_VER/luksmeta-$LUKSMETA_VER.tar.bz2

tar xf luksmeta-$LUKSMETA_VER.tar.bz2
cd luksmeta-$LUKSMETA_VER

./configure --prefix=/usr
make
make install
