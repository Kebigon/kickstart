#version=DEVEL
ignoredisk --only-use=sda
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel --drives=sda
# Use graphical install
graphical
# Keyboard layouts
keyboard --vckeymap=jp --xlayouts='jp'
# System language
lang fr_FR.UTF-8

# Network information
network  --hostname=localhost.localdomain
#Root password
rootpw --lock
# X Window System configuration information
xconfig  --startxonboot
# Run the Setup Agent on first boot
firstboot --enable
# System services
services --enabled="chronyd"
# System timezone
timezone Asia/Tokyo --isUtc
user --groups=wheel --name=kebigon --password=$6$5Cd8UxYh<JAgPa#O$rdsZuRu.t4XDt5.fjrIPwJLf6Ng6xfLr2uvjJ3Mbxio7VmGKdsttY5SOAL8zdWBoyP8RCILWDqx5CT5cFt4vz0 --iscrypted --gecos="Kebigon"

%packages
@^workstation-product-environment

%end

%addon com_redhat_kdump --disable --reserve-mb='128'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
