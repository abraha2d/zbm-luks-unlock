#!/bin/sh

set -e

xbps-install -Syu xbps
xbps-install -y gcc pkg-config cryptsetup cryptsetup-devel make xz meson jansson-devel tpm2-tools
