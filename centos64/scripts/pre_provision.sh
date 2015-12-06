#!/bin/bash -eux

### copy provisoning scripts
mkdir -p /var/packer_build/
cp -rf /tmp/packer_build /var/
cd /var/packer_build
find ./ -name '*.sh' -type f -print | xargs chmod 777


# pre provision
/var/packer_build/base/base.sh
/var/packer_build/base/reboot.sh