#!/bin/bash
set -e

wget {{ site.url }}/config/gitconfig -O /etc/skel/.gitconfig
