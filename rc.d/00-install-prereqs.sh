#!/bin/sh

set -e

# repo-default.voidlinux.org is frequently bork
rm /etc/xbps.d/00-custom-repos.conf
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sed -i 's|https://repo-default.voidlinux.org|https://mirror.clarkson.edu/voidlinux|g' /etc/xbps.d/*-repository-*.conf

xbps-pkgdb -m hold ncurses ncurses-base ncurses-libs  # ncurses-base-6.5_1 is bork
xbps-pkgdb -m hold libblkid libuuid  # avoid a waterfall of upgrades

xbps-install -Syu xbps
xbps-install -y gcc pkg-config cryptsetup cryptsetup-devel make xz meson jansson-devel tpm2-tools plymouth
