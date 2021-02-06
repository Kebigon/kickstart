#!/bin/bash
set -e

# Firefox extension manager
wget --header='Accept-Encoding:none' -O /usr/bin/firefox-extension-manager https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/mozilla/firefox-extension-manager
chmod +x /usr/bin/firefox-extension-manager

mkdir -p /etc/skel/.mozilla/firefox/default/extensions

firefox-extension-manager --install --path /etc/skel/.mozilla/firefox/default/extensions --url https://addons.mozilla.org/firefox/addon/ublock-origin
firefox-extension-manager --install --path /etc/skel/.mozilla/firefox/default/extensions --url https://addons.mozilla.org/firefox/addon/localcdn-fork-of-decentraleyes
firefox-extension-manager --install --path /etc/skel/.mozilla/firefox/default/extensions --url https://addons.mozilla.org/firefox/addon/clearurls
firefox-extension-manager --install --path /etc/skel/.mozilla/firefox/default/extensions --url https://addons.mozilla.org/firefox/addon/temporary-containers

cp -R /etc/skel/.mozilla/firefox/default/extensions /etc/skel/.mozilla/firefox/meet/extensions
cp -R /etc/skel/.mozilla/firefox/default/extensions /etc/skel/.mozilla/firefox/netflix/extensions
