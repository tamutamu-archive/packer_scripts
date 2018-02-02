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
./bin/elasticsearch-plugin install analysis-icu
popd


### config
sed -i:bk \
    -e 's@^\(#http.port:.*$\)@\1\nhttp.port: 9200@' \
    -e 's@^\(#network.host:.*$\)@\1\nnetwork.host: ["_local_"]@' \
    /etc/elasticsearch/elasticsearch.yml

popd

systemctl restart elasticsearch
systemctl enable elasticsearch
