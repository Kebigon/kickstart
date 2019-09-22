#!/bin/bash
set -e

# Download the hosts file
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts -O /etc/hosts

# Setup a cron to update the hosts file everyday at 20:00
wget {{ site.url }}/config/hosts.cron -O /etc/cron.d/hosts
