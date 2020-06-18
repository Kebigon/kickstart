#!/bin/bash
set -e

git clone https://github.com/Kebigon/dwm.git /tmp/dwm
cd /tmp/dwm
make clean install
cd -
rm /tmp/dwm
