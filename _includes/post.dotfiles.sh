#!/bin/bash
set -e

# Clone my dotfiles repository
git clone --bare https://github.com/Kebigon/dotfiles.git /etc/skel/.dotfiles

# Create an alias of the git command
alias dotfiles='/usr/bin/git --git-dir=/etc/skel/.dotfiles/ --work-tree=/etc/skel'

# Remove default dotfiles
rm -f /etc/skel/.bash_logout /etc/skel/.bash_profile /etc/skel/.bashrc

# Create the working tree inside /etc/skel
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
