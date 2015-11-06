#!/usr/bin/env bash

# Base activities
set -ux

TYPE="Server"
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Fix slow DNS lookups with VirtualBox's DNS proxy:
# https://github.com/mitchellh/vagrant/issues/1172#issuecomment-9438465
echo 'options single-request-reopen' >> /etc/resolv.conf

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config


# Update and Install software
yum -y update
yum -y install epel-release
yum -y install gcc make gcc-c++ \
               kernel-devel-`uname -r` kernel-headers-$(uname -r) \
               dkms zlib-devel openssl-devel net-tools \
               readline-devel sqlite-devel perl \
               curl wget bzip2 nfs-utils tee

if [[ "${PACKER_BUILD_NAME}" =~ .*-desktop-* ]]; then
  echo "We have a desktop version"
  yum -y groupinstall "X Window System"
  yum -y install gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts
  systemctl set-default graphical.target
  TYPE="Desktop"
fi

[ -f /etc/system-release ] && echo -e "Linux Distribution: " `cat /etc/system-release` | tee -a /tmp/packer_info
echo -e "Kernel Information: " `uname -smr` | tee -a /tmp/packer_info
echo "Type: $TYPE"
