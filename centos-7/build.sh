#!/bin/sh

set -e

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Use one of the following Packer template files as argument"
    for f in *.json; do echo "./$f"; done
    exit 1
fi

if [ ! -f $1 ]; then
    echo "Template file not found!"
    exit 1
fi

NAME=$(basename $1 .json)
: ${BUILD_VERSION:="v$(date +'%Y%m%d')"}
export BUILD_VERSION

rm -i builds/$NAME-${BUILD_VERSION}.box || true
packer build $1
shasum -a 256 builds/$NAME-${BUILD_VERSION}.box

# $ vagrant box add builds/centos-7-x86_64-desktop-vbox-puppet-v20151026.box  --name centos-7-x86_64-desktop-vbox-puppet --force
