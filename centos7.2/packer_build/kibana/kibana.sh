#!/bin/bash
set -euo pipefail

echo 'Install JDK 6,7,8'
CURDIR=$(cd $(dirname $0); pwd)


pushd /tmp

wget https://artifacts.elastic.co/downloads/kibana/kibana-6.1.1-linux-x86_64.tar.gz
tar zxf ./kibana-6.1.1-linux-x86_64.tar.gz
mv ./kibana-6.1.1-linux-x86_64 /opt/kiban

popd
