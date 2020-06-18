---
---

# https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/appendixes/Kickstart_Syntax_Reference/

# Configure installation method
install
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch&country=JP"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch&country=JP" --cost=0
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch&country=JP" --includepkgs=rpmfusion-free-release
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch&country=JP" --cost=0
repo --name=vscodium --install --baseurl="https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/rpms/" --cost=0
repo --name=jitsi --install --baseurl="https://download.jitsi.org/jitsi/rpm/" --cost=0

# zerombr
zerombr

# Configure Boot Loader
bootloader --location=mbr --driveorder=sda

# Create Physical Partitions
ignoredisk --only-use=sda
reqpart --add-boot
part swap --recommended
part / --grow --fstype=xfs

# Remove all existing partitions
clearpart --all --drives=sda

# Configure Firewall
firewall --enabled

# Configure Network Interfaces
network --hostname=localhost

# Configure Keyboard Layouts
keyboard --vckeymap=jp --xlayouts='jp'

# Configure Language During Installation
lang fr_FR.UTF-8

# Configure X Window System
xconfig --startxonboot

# Configure Time Zone
timezone Asia/Tokyo

# Set Root Password
rootpw --lock

# Perform Installation in Text Mode
text

# System services
services --enabled="chronyd"

# Package Selection
%packages

@^workstation-product-environment
codium
filezilla
fuse-exfat
fuse-sshfs
jitsi
keepassxc
make
notepadqq
torbrowser-launcher
vlc

# Remove uneeded packages from gnome-desktop
-gedit
-gnome-boxes
-gnome-software
-cheese
-chrome-gnome-shell
-gnome-calendar
-gnome-clocks
-gnome-contacts
-gnome-maps
-gnome-photos
-gnome-weather
-totem

# Remove uneeded packages from libreoffice
-libreoffice-math
-libreoffice-impress

# Remove uneeded packages from workstation-product
-fedora-chromium-config
-rhythmbox

%end


{% assign scripts = "gpg, dotfiles, anki, eclipse, firefox, freefilesync, hosts, veracrypt" | split: ", " %}

{% for script in scripts %}

%post --log=/root/ks-{{ script }}.log
{% include {{script}}/{{ script }}.post.sh %}
%end

{% endfor %}

# Run the Setup Agent on first boot
firstboot --enable

# Reboot After Installation
reboot --eject
