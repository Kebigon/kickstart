---
---

# https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/appendixes/Kickstart_Syntax_Reference/

# Configure installation method
install
url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch&country=JP
repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch&country=JP
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch&country=JP

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
timezone Asia/Tokyo --isUtc

# Set Root Password
rootpw --lock

# Perform Installation in Text Mode
text

# System services
services --enabled="chronyd"

# Package Selection
%packages
@^workstation-product-environment
fuse-sshfs
make
%end


{% assign scripts = "anki, firefox, freefilesync, git, hosts, password-gorilla, veracrypt" | split: ", " %}

{% for script in scripts %}

%post --log=/root/ks-{{ script }}.log
{% include post.{{ script }}.sh %}
%end

{% endfor %}

# Run the Setup Agent on first boot
firstboot --enable

# Reboot After Installation
reboot --eject
