#!/bin/bash
set -e

# Install password-gorilla into /usr/local/bin
wget --no-check-certificate https://gorilla.dp100.com/downloads/gorilla1537_64.bin -O /usr/local/bin/password-gorilla
echo "f1dc0d1fbc9da678e1ee4031ff83eb3ca72c64551240f2f235cb736063f8df247b19c75e0a43310eb876abe8bff39aef0b69fc1f359cf98ac88d26357d221d27 /usr/local/bin/password-gorilla" | sha512sum -c -
chmod +x /usr/local/bin/password-gorilla

# Create launcher
wget {{ site.url }}/config/password-gorilla.desktop -O /usr/share/applications/password-gorilla.desktop
