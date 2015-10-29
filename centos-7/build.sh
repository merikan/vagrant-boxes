#!/bin/sh

set -e

: ${BUILD_VERSION:="v$(date +'%Y%m%d')"}
export BUILD_VERSION

rm -i builds/*-${BUILD_VERSION}.box || true
packer build template.json
shasum -a 256 builds/*-${BUILD_VERSION}.box

# $ vagrant box add builds/centos-7-x86_64-desktop-vbox-puppet-v20151026.box  --name centos-7-x86_64-desktop-vbox-puppet --force
