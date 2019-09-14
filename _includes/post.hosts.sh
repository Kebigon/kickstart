#!/bin/bash
set -e

# Download the hosts file
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts -O /etc/hosts

# Setup a cron to update the hosts file everyday at 20:00
cat << EOF > /etc/cron.d/hosts
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

0 20 * * * root wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts -O /etc/hosts
EOF
