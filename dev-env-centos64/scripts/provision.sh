#!/bin/bash -eux

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

### copy provisoning scripts
mkdir -p /var/packer_build/
cp -rf /tmp/packer_build /var/
cd /var/packer_build
find ./ -name *.sh -type f -print | xargs chmod 777

# Start Install
ls /tmp/
ls /var/packer_build/
/var/packer_build/install.sh