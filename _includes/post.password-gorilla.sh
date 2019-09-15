#!/bin/bash
set -e

# Install password-gorilla into /usr/local/bin
wget --no-check-certificate https://gorilla.dp100.com/downloads/gorilla1537_64.bin -O /usr/local/bin/password-gorilla

# Create launcher
cat << EOF > /usr/share/applications/password-gorilla.desktop
[Desktop Entry]
Version=1.0
Name=Password Gorilla
Comment=a password manager
Comment[de]=Programm zum Verwalten von Passwörtern
Keywords=safe;security
Type=Application
Exec=password-gorilla
Icon=password-gorilla
StartupNotify=false
Terminal=false
Categories=Utility;
EOF
