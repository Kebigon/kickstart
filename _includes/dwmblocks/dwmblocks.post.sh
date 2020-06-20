#!/bin/bash
set -e

git clone https://github.com/Kebigon/dwmblocks.git /tmp/dwmblocks
cd /tmp/dwmblocks
make clean install
cd -
rm /tmp/dwmblocks
