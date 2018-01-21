#!/bin/bash
set -euo pipefail

echo 'Install JDK 6,7,8'
CURDIR=$(cd $(dirname $0); pwd)

pushd /tmp

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.1.zip
unzip -q elasticsearch-6.1.1.zip
mv elasticsearch-6.1.1 /opt/elasticsearch

popd
