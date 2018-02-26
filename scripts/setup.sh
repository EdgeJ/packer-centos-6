#!/bin/bash -eux

# install/upgrade packages
yum -y upgrade
yum -y install openssl-devel kernel-devel zlib-devel
yum -y install epel-release wget curl rsync
yum -y install gcc git
yum clean all

# update root certs
wget -O/etc/pki/tls/certs/ca-bundle.crt http://curl.haxx.se/ca/cacert.pem \
  --no-check-certificate

# add ssh key for vagrant
mkdir ~vagrant/.ssh
[ -f ~vagrant/.ssh/authorized_keys ] && rm -f ~vagrant/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > ~vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant ~vagrant/.ssh
chmod 0700 ~vagrant/.ssh
chmod 0600 ~vagrant/.ssh/authorized_keys

# install guest additions
TEMP_DIR=$(mktemp -d)
KERN_DIR=/usr/src/kernels/$(uname -r)/build
export KERN_DIR

mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso ${TEMP_DIR}

${TEMP_DIR}/VBoxLinuxAdditions.run

umount ${TEMP_DIR}
rm -rf /root/VBoxGuestAdditions
