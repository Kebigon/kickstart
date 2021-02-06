#!/bin/bash
set -e

# Download Anki
anki_major_version=2.1
anki_minor_version=35
anki_version=${anki_major_version}.${anki_minor_version}


wget -O - https://github.com/ankitects/anki/releases/download/${anki_version}/anki-${anki_version}-linux-amd64.tar.bz2 | tar -xj -C /tmp
cd /tmp/anki-${anki_version}-linux-amd64
make install
cd -
rm -rf /tmp/anki-${anki_version}-linux-amd64

# Download Anki Add-on from AnkiWeb
# $1: Add-on code
# $2: Add-on name
download_anki_addon() {
	local addon_url="https://ankiweb.net/shared/download/$1?v=${anki_major_version}&p=${anki_minor_version}"
	local addon_zip=/tmp/$1.zip
	local addon_dir=/etc/skel/.local/share/Anki2/addons21/$1

	# Download the add-on itself
	wget $addon_url -O $addon_zip
	mkdir -p $addon_dir
	unzip $addon_zip -d $addon_dir
	rm $addon_zip

	# Create the meta.json file
	# timestamp="$(date +"%s")"
	# echo "{\"name\": \"$2\", \"mod\": $timestamp, \"min_point_version\": $anki_minor_version, \"max_point_version\": -$anki_minor_version}" > $addon_dir/meta.json
}

download_anki_addon 3918629684 "Japanese Support"
download_anki_addon 900801631 "MorphMan for Anki 21"
download_anki_addon 1666520655 "Migaku Retirement"

# Update MorphMan configuration
sed -i "s/'max good sentence length': 30/'max good sentence length': 15/" /etc/skel/.local/share/Anki2/addons21/900801631/morph/config.py
