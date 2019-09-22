#!/bin/bash
set -e

# Install FreeFileSync into /opt
wget -O - {{ site.url }}/softwares/FreeFileSync_10.8_Linux.tar.gz | tar -xz -C /opt
unzip /opt/FreeFileSync/Resources.zip FreeFileSync.png -d /opt/FreeFileSync

# Create launcher
wget {{ site.url }}/config/FreeFileSync.desktop -O /usr/share/applications/FreeFileSync.desktop
