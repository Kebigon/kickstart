#!/bin/bash
set -e
PATH=$PATH:/usr/local/bin

# Profiles
wget {{ site.url }}/config/firefox-profiles.ini -O /etc/skel/.mozilla/firefox/profiles.ini

# ghacks user.js
wget https://raw.githubusercontent.com/ghacksuserjs/ghacks-user.js/master/user.js -O /etc/firefox/user.js

# Setup a cron to update the user.js file everyday at 20:00
wget {{ site.url }}/config/user.js.cron -O /etc/cron.d/user.js

# Firefox extension manager
wget --header='Accept-Encoding:none' -O /usr/local/bin/firefox-extension-manager https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/mozilla/firefox-extension-manager
chmod +x /usr/local/bin/firefox-extension-manager

# Home profile
HOME_PROFILE=kebigon.default
install_extension $HOME_PROFILE ublock-origin
install_extension $HOME_PROFILE https-everywhere
install_extension $HOME_PROFILE privacy-badger17
install_extension $HOME_PROFILE decentraleyes
install_extension $HOME_PROFILE temporary-containers
install_extension $HOME_PROFILE rikaichamp
ln -s /etc/firefox/user.js /etc/skel/.mozilla/firefox/$HOME_PROFILE/user.js

# Work profile
WORK_PROFILE=kebigon.work
install_extension $WORK_PROFILE ublock-origin
install_extension $WORK_PROFILE https-everywhere
install_extension $WORK_PROFILE privacy-badger17
install_extension $WORK_PROFILE decentraleyes
install_extension $WORK_PROFILE rikaichamp

# Download and install a Firefox extension into a profile
# $1: Profile
# $2: Extension
install_extension() {
	# Create needed folders
	EXTENSIONS_FOLDER=/etc/skel/.mozilla/firefox/$1/extensions
	mkdir $EXTENSIONS_FOLDER -p

	firefox-extension-manager --install --path $EXTENSIONS_FOLDER --url https://addons.mozilla.org/firefox/addon/$2
}
