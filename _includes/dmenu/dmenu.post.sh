#!/bin/bash
set -e

git clone https://git.suckless.org/dmenu /tmp/dmenu
cd /tmp/dmenu
make clean install
cd -
rm /tmp/dmenu
