---
---

# https://docs.fedoraproject.org/en-US/fedora/rawhide/install-guide/appendixes/Kickstart_Syntax_Reference/
# https://github.com/sinner-/kickstart-fedora-workstation/blob/master/workstation.ks

# Configure installation method
install
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch&country=JP"
repo --name=fedora --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch&country=JP"
repo --name=updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch&country=JP" --cost=0
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch&country=JP" --includepkgs=rpmfusion-free-release
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch&country=JP" --cost=0

{% for repository in page.repositories %}
repo --name={{ repository.name }} --baseurl="{{ repository.baseurl }}" --cost=0

{% if repository.key %}
%post --log=/root/ks-gpg-{{ repository.name }}.log
rpm --import "{{ repository.key }}"
%end
{% endif %}

{% endfor %}

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
filezilla
fuse-sshfs
gnome-tweak-tool
keepassxc
make
# notepadqq
torbrowser-launcher
vlc

# Remove uneeded packages from gnome-desktop
-cheese
-chrome-gnome-shell
-gedit
-gnome-boxes
-gnome-calendar
-gnome-clocks
-gnome-contacts
-gnome-maps
-gnome-photos
-gnome-software
-gnome-weather
-totem

# Remove uneeded packages from container-management
-@container-management

# Remove uneeded packages from firefox
-@firefox
firefox

# Remove uneeded packages from libreoffice
-@libreoffice
libreoffice-calc
libreoffice-writer

# Remove uneeded packages from workstation-product
-fedora-chromium-config
-rhythmbox

{% for package in page.packages %}
{{ package }}
{% endfor %}

%end

{% for script in page.scripts %}

%post --log=/root/ks-{{ script }}.log
{% include {{script}}/{{ script }}.post.sh %}
%end

{% endfor %}

# Run the Setup Agent on first boot
firstboot --enable

# Reboot After Installation
reboot --eject
