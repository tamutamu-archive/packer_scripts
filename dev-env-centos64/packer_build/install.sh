#!/bin/bash -eux

### execute provisoning scripts
BASEDIR=/var/packer_build

# base
bash -l $BASEDIR/base/base.sh
bash -l $BASEDIR/base/vagrant.sh
bash -l $BASEDIR/base/virtualbox.sh
## bash -l $BASEDIR/base/zerodisk.sh


# common develop
bash -l $BASEDIR/common-dev/common-dev.sh


# Apache 
bash -l $BASEDIR/apache/apache.sh


# database
export MYSQL_IMPL=mysql
export MYSQL_HOST=localhost
export MYSQL_ROOT_PASSWORD=pass

bash -l $BASEDIR/mysql/mysql.sh
bash -l $BASEDIR/postgresql/postgresql.sh
bash -l $BASEDIR/openldap/openldap.sh


# java develop
bash -l $BASEDIR/java/java-dev.sh


# Tomcat develop
export TOMCAT_DEV_CONTEXT=xample

bash -l $BASEDIR/tomcat/tomcat.sh
bash -l $BASEDIR/artifactory/artifactory.sh
bash -l $BASEDIR/gitbucket/gitbucket.sh


# ruby develop
export RUBY_VERSION=2.0.0-p643

bash -l $BASEDIR/ruby/ruby.sh


# redmine
export REDMINE_DB=redminedb
export REDMINE_USER=user_redmine
export REDMINE_PASS=pass

export REDMINE_PATH=/var/lib
export REDMINE_VER=2.3.2

bash -l $BASEDIR/redmine/redmine.sh


# terminate
bash -l $BASEDIR/base/cleanup.sh
