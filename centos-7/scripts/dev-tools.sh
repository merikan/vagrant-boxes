#!/usr/bin/env bash

# Base activities
set -eux

# Install extra dev tools

# Acrobate Reader
cd /tmp
wget http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i486linux_enu.rpm
yum -y localinstall http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
yum -y localinstall AdbeRdr9.5.5-1_i486linux_enu.rpm
rm -f AdbeRdr9.5.5-1_i486linux_enu.rpm

# Java
cd /tmp
wget --no-cookies --no-check-certificate \
     --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
     "http://download.oracle.com/otn-pub/java/jdk/8u66-b14/jdk-8u66-linux-x64.rpm"
rpm -ivh jdk-8u66-linux-x64.rpm
rm -f jdk-8u66-linux-x64.rpm

# Git
yum -y install git

# Firefox
yum -y install firefox

# Terminator
yum -y install terminator

# gedit
yum -y install gedit

# emacs
yum -y install emacs

# gnome-system-monitor
yum -y install gnome-system-monitor

# sysstat
yum -y install sysstat

# tcpdump
yum -y install tcpdump
