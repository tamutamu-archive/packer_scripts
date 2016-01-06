#!/bin/bash

lxc-create -t centos -n $1
echo 'lxc.kmsg = 0' >> /var/lib/lxc/$1/config

lxc-start -n $1 -d 
