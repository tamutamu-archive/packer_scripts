#!/bin/bash

yum -y install epel-release
yum -y install asciidoc xmlto rsync wget rpm-build

yum -y install kvm virt-manager libvirt libvirt-python python-virtinst

yum -y install --enablerepo=epel docbook2X docbook-utils libcap-devel docbook2X graphviz


wget https://linuxcontainers.org/downloads/lxc-1.0.5.tar.gz

tar zxf lxc-1.0.5.tar.gz
mkdir -p mkdir ~/rpmbuild/SPECS ~/rpmbuild/SOURCES

cp lxc-1.0.5/lxc.spec ~/rpmbuild/SPECS/
cp lxc-1.0.5.tar.gz ~/rpmbuild/SOURCES/

rpmbuild -bb ~/rpmbuild/SPECS/lxc.spec
cd ~/rpmbuild/RPMS/x86_64

rpm -ivh lxc-1.0.5-1.el6.x86_64.rpm lxc-libs-1.0.5-1.el6.x86_64.rpm

systemctl start libvirtd.service
systemctl start cgconfig.service