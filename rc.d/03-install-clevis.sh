#!/bin/sh

set -e

CLEVIS_GH_REPO=https://github.com/latchset/clevis
CLEVIS_VER=20
TMP_DIR=/tmp/clevis

rm -rf $TMP_DIR
mkdir $TMP_DIR
cd $TMP_DIR

curl -LO $CLEVIS_GH_REPO/releases/download/v$CLEVIS_VER/clevis-$CLEVIS_VER.tar.xz

tar xf clevis-$CLEVIS_VER.tar.xz
cd clevis-$CLEVIS_VER

# v20 is bork: https://github.com/latchset/clevis/issues/456
echo "set +eu" >>src/luks/dracut/clevis/clevis-hook.sh.in

mkdir build
cd build

meson setup .. --prefix=/usr
ninja
ninja install

: >/usr/libexec/clevis-luks-unlocker
