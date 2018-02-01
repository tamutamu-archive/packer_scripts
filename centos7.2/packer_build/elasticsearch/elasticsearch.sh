#!/bin/bash
set -euo pipefail

echo 'Install Elasticsearch'
CURDIR=$(cd $(dirname $0); pwd)

pushd /tmp

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

cat << EOT > /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-6.x]
name=Elasticsearch repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOT

yum -y install elasticsearch-6.1.1

pushd /usr/share/elasticsearch
./bin/elasticsearch-plugin install analysis-kuromoji
popd

popd
