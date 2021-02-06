#!/bin/bash
set -e

VERACRYPT_VERSION=1.24-Update7

# Download Veracrypt installation package, and extract veracrypt-[version]-setup-gui-x64
wget -O - https://launchpad.net/veracrypt/trunk/${VERACRYPT_VERSION,,}/+download/veracrypt-$VERACRYPT_VERSION-setup.tar.bz2 | tar -xj -C /tmp --no-overwrite-dir veracrypt-$VERACRYPT_VERSION-setup-gui-x64

# Extract veracrypt_install_gui_x64.sh
/tmp/veracrypt-$VERACRYPT_VERSION-setup-gui-x64 --tar xf -C /tmp --no-overwrite-dir

# Extract variable PACKAGE_START
eval "$(grep -a PACKAGE_START /tmp/veracrypt_install_gui_x64.sh | head -1)"

# Install Veracrypt
tail -n +$PACKAGE_START /tmp/veracrypt_install_gui_x64.sh | tar -C / --no-overwrite-dir -xpzv

# Cleanup
rm -f /tmp/veracrypt_install_gui_x64.sh
rm -f /tmp/veracrypt-$VERACRYPT_VERSION-setup-gui-x64
