---
---

# https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/appendixes/Kickstart_Syntax_Reference/

# Configure installation method
install
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch&country=JP"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch&country=JP" --cost=0
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch&country=JP" --includepkgs=rpmfusion-free-release
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch&country=JP" --cost=0
repo --name=alacritty --install --baseurl="https://download.copr.fedorainfracloud.org/results/pschyska/alacritty/fedora-$releasever-$basearch/"

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

# user --name=kebigon --password=changeme --groups=wheel

# Perform Installation in Text Mode
text

# System services
services --enabled="chronyd"

# Package Selection
%packages

sudo
initial-setup

# Development Tools
gcc
git
make

# Local X.org display server
@base-x

# Libraries needed to compile dwm and dmenu
libX11-devel
libXft-devel
libXinerama-devel

# fonts
adobe-source-code-pro-fonts

alacritty
firefox
torbrowser-launcher

%end

{% assign scripts = "gpg, dwm, dmenu, dotfiles, firefox" | split: ", " %}

{% for script in scripts %}

%post --log=/root/ks-{{ script }}.log
{% include {{ script }}/{{ script }}.post.sh %}
%end

{% endfor %}

# Run the Setup Agent on first boot
firstboot --enable

# Reboot After Installation
reboot --eject
