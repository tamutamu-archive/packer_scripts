yum -y install gcc make gcc-c++ perl

yum -y install kernel-devel-2.6.32-573.8.1.el6.x86_64
export KERN_DIR=/usr/src/kernels/2.6.32-573.8.1.el6.x86_64

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

