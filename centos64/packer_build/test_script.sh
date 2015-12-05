#!/bin/bash -eux

### execute provisoning scripts
BASEDIR=/var/packer_build

# common develop
bash -l $BASEDIR/common_dev/common_dev.sh


# Apache 
bash -l $BASEDIR/apache/apache.sh
