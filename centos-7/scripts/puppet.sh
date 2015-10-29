# Puppet activities
set -eux

cat > /etc/yum.repos.d/puppetlabs.repo << EOF
[puppetlabs-dependencies]
name=puppetlabdsdependencies
baseurl=http://yum.puppetlabs.com/el/7/dependencies/\$basearch
enabled=1
gpgcheck=0

[puppetlabs]
name=puppetlabs
baseurl=http://yum.puppetlabs.com/el/7/products/\$basearch
enabled=1
gpgcheck=0
EOF

yum -y install puppet facter ruby-shadow
