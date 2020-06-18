#!/bin/bash
set -e

# Alacritty
rpm --import https://download.copr.fedorainfracloud.org/results/pschyska/alacritty/pubkey.gpg
# VSCodium
rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg

