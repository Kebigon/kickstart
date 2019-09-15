#!/bin/bash
set -e

# Install FreeFileSync into /opt
wget -O - {{ site.url }}/softwares/FreeFileSync_10.8_Linux.tar.gz | tar -xz -C /opt
unzip /opt/FreeFileSync/Resources.zip FreeFileSync.png -d /opt/FreeFileSync

# Create launcher
cat << EOF > /usr/share/applications/FreeFileSync.desktop
[Desktop Entry]
Type=Application
Name=FreeFileSync
GenericName=Folder Comparison and Synchronization
GenericName[de_DE]=Ordnervergleich und Synchronisation
Exec=/opt/FreeFileSync/FreeFileSync %F
Icon=/opt/FreeFileSync/FreeFileSync.png
NoDisplay=false
Terminal=false
Categories=Utility;FileTools;
StartupNotify=true
EOF
