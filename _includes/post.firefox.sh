#!/bin/bash
set -e
PATH=$PATH:/usr/local/bin

# Create needed folders
EXTENSIONS_FOLDER=/etc/skel/.mozilla/firefox/kebigon.default/extensions
mkdir $EXTENSIONS_FOLDER -p

# Profiles
wget {{ site.url }}/config/firefox-profiles.ini -O /etc/skel/.mozilla/firefox/profiles.ini

# ghacks user.js
FIREFOX_VERSION=68.0
wget -O - https://github.com/ghacksuserjs/ghacks-user.js/archive/$FIREFOX_VERSION.tar.gz | tar -xz --strip=1 -C /etc/skel/.mozilla/firefox/kebigon.default ghacks-user.js-$FIREFOX_VERSION/user.js

# Firefox extension manager
wget --header='Accept-Encoding:none' -O /usr/local/bin/firefox-extension-manager https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/mozilla/firefox-extension-manager
chmod +x /usr/local/bin/firefox-extension-manager

# uBlock Origin
firefox-extension-manager --install --path $EXTENSIONS_FOLDER --url https://addons.mozilla.org/firefox/addon/ublock-origin

# HTTPS Everywhere
firefox-extension-manager --install --path $EXTENSIONS_FOLDER --url https://addons.mozilla.org/firefox/addon/https-everywhere

# Privacy Badger
firefox-extension-manager --install --path $EXTENSIONS_FOLDER --url https://addons.mozilla.org/firefox/addon/privacy-badger17

# Decentraleyes
firefox-extension-manager --install --path $EXTENSIONS_FOLDER --url https://addons.mozilla.org/firefox/addon/decentraleyes

# Temporary Containers
firefox-extension-manager --install --path $EXTENSIONS_FOLDER --url https://addons.mozilla.org/firefox/addon/temporary-containers

# Rikaichamp
firefox-extension-manager --install --path $EXTENSIONS_FOLDER --url https://addons.mozilla.org/firefox/addon/rikaichamp
