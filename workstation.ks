---
layout: default
repositories:
- name: vscodium
  baseurl: https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
  key: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
packages:
- codium
scripts: [ base, dotfiles, anki, eclipse, firefox, freefilesync, veracrypt ]
---
