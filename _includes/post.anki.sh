#!/bin/bash
set -e

# Download Anki
anki_version=2.1.15

wget -O - https://apps.ankiweb.net/downloads/current/anki-${anki_version}-linux-amd64.tar.bz2 | tar -xj -C /tmp
cd /tmp/anki-${anki_version}-linux-amd64
make install
cd -
rm -rf /tmp/anki-${anki_version}-linux-amd64

# Low-Key Anki 2.1
wget "{{ site.url }}/softwares/Low-Key Anki 2.1.zip" -O "/tmp/Low-Key Anki 2.1.zip"
mkdir -p /etc/skel/.local/share/Anki2/addons21
unzip "/tmp/Low-Key Anki 2.1.zip" -d /etc/skel/.local/share/Anki2/addons21
rm "/tmp/Low-Key Anki 2.1.zip"

# Download Anki Add-on from AnkiWeb
# $1: Add-on code
download_anki_addon() {
	local addon_url=https://ankiweb.net/shared/download/$1?v=2.1
	local addon_zip=/tmp/$1.zip
	local addon_dir=/etc/skel/.local/share/Anki2/addons21/$1

	wget $addon_url -O $addon_zip
	mkdir -p $addon_dir
	unzip $addon_zip -d $addon_dir
	rm $addon_zip
}

# Japanese Support
download_anki_addon 3918629684
# MorphMan for Anki 2.1
download_anki_addon 900801631
# MIA Retirement Addon
download_anki_addon 1666520655

# Update MorphMan configuration
sed -i "s/'min good sentence length': 2/'min good sentence length': 5/" /etc/skel/.local/share/Anki2/addons21/900801631/morph/config.py
sed -i "s/'max good sentence length': 8/'max good sentence length': 15/" /etc/skel/.local/share/Anki2/addons21/900801631/morph/config.py

# Cleaning
find /etc/skel -name __MACOSX -exec rm -rfv "{}" \;
find /etc/skel -name .DS_Store -exec rm -rfv "{}" \;
