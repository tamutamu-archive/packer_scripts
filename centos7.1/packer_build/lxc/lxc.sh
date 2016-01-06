#!/bin/bash


### no IPv6
#echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
#echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
#echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/disableipv6.conf


yum -y install epel-release
yum -y install asciidoc xmlto rsync wget rpm-build

yum -y install kvm virt-manager libvirt libvirt-python python-virtinst libcgroup libcgroup-tools

yum -y install --enablerepo=epel docbook2X docbook-utils libcap-devel docbook2X graphviz


wget https://linuxcontainers.org/downloads/lxc/lxc-1.1.1.tar.gz 

tar zxf lxc-1.1.1.tar.gz
mkdir -p ~/rpmbuild/SPECS ~/rpmbuild/SOURCES

cp lxc-1.1.1/lxc.spec ~/rpmbuild/SPECS/
cp lxc-1.1.1.tar.gz ~/rpmbuild/SOURCES/

rpmbuild -bb ~/rpmbuild/SPECS/lxc.spec
cd ~/rpmbuild/RPMS/x86_64

rpm -ivh lxc-1.1.1-1.el7.centos.x86_64.rpm lxc-libs-1.1.1-1.el7.centos.x86_64.rpm

sed -i.orig -e 's/^lxc.cap.drop =/# lxc.cap.drop =/g' /usr/share/lxc/config/centos.common.conf

systemctl start libvirtd
systemctl enable libvirtd

systemctl start cgconfig
systemctl enable cgconfig


systemctl start lxc-net
systemctl enable lxc-net