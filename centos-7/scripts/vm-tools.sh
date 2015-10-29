# Install VM tools
set -eux

if [[ "${PACKER_BUILD_NAME}" =~ .*-vbox-* ]]; then
  echo "Installing VirtualBox packages"

  # Bail if we are not running inside VirtualBox.
  # This is a Puppet command!!
  if [[ `facter virtual` != "virtualbox" ]]; then
      exit 0
  fi

  mkdir -p /mnt/virtualbox
  mount -o loop /home/vagrant/VBoxGuest*.iso /mnt/virtualbox
  sh /mnt/virtualbox/VBoxLinuxAdditions.run
  ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
  umount /mnt/virtualbox
  rm -rf /home/vagrant/VBoxGuest*.iso

  echo "VirtualBox Guest Additions $(cat /root/.vbox_version)"
fi
