#!/bin/bash -eux

# install guest additions
TEMP_DIR=$(mktemp -d)
KERN_DIR=/usr/src/kernels/$(uname -r)/build
export KERN_DIR

yum -y install kernel-devel
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso ${TEMP_DIR}
${TEMP_DIR}/VBoxLinuxAdditions.run
umount ${TEMP_DIR}
rm -rf /root/VBoxGuestAdditions.iso
