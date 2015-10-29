# Base activities
set -eux

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
               curl wget nfs-utils

if [[ "${PACKER_BUILD_NAME}" =~ .*-desktop-* ]]; then
  echo "We have a desktop version"
  yum -y groupinstall basic-desktop desktop-platform x11 fonts
fi
