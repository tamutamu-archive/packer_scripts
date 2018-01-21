#!/bin/bash
set -euo pipefail

echo 'Install Fluentd.'
CURDIR=$(cd $(dirname $0); pwd)

curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh

service td-agent start
systemctl enable td-agent
