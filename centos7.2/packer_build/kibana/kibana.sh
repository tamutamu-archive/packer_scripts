#!/bin/bash
set -euo pipefail

echo 'Install kiban.'
CURDIR=$(cd $(dirname $0); pwd)


pushd /tmp

cat << EOT > /etc/yum.repos.d/kibana.repo
[kibana-6.x]
name=Kibana repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOT

yum -y install kibana-6.1.1

### config
sed -i:bk \
    -e 's@^\(#elasticsearch.url:.*$\)@\1\nelasticsearch.url: http://localhost:9200@' \
    -e 's@^\(#server.host:.*$\)@\1\nserver.host: "0.0.0.0"@' \
    -e 's@^\(#server.port:.*$\)@\1\nserver.port: 5601@' \
    /etc/kibana/kibana.yml

popd

systemctl restart kibana
systemctl enable kibana
