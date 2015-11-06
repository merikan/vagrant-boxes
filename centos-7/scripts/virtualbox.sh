#!/usr/bin/env bash

# Install VirtualBox packages
set -ux

echo "Installing VirtualBox Guest Additions"

VBOX_VERSION=$(cat /root/.vbox_version)
cd /tmp
mount -o loop /root/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /root/VBoxGuestAdditions_*.iso

echo "VirtualBox Guest Additions $(cat /root/.vbox_version)" | tee -a /tmp/packer_info
