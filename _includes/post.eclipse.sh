#!/bin/bash
set -e

version="2019-12"
mirror="http://ftp.jaist.ac.jp/pub/eclipse"

# Install eclipse into /opt
wget -O - "${mirror}/technology/epp/downloads/release/${version}/R/eclipse-java-${version}-R-linux-gtk-x86_64.tar.gz" | tar -xz -C /opt

# Create launcher
wget {{ site.url }}/config/eclipse.desktop -O /usr/share/applications/eclipse.desktop

# Install lombok
wget https://projectlombok.org/downloads/lombok.jar -O /tmp
java -jar /tmp/lombok.jar install /opt/eclipse
rm /tmp/lombok.jar