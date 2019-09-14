#!/bin/bash
set -e

cat << EOF > /etc/skel/.gitconfig
[user]
        name = Kebigon
        email = git@kebigon.xyz
[core]
        editor = nano
[credential]
        helper = cache
EOF
