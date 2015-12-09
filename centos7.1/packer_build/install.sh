#!/bin/bash -eux

### execute provisoning scripts
BASEDIR=/var/packer_build


# common develop
bash -l $BASEDIR/common_dev/common_dev.sh


# Apache 
bash -l $BASEDIR/apache/apache.sh


# database
bash -l $BASEDIR/postgresql/postgresql.sh


# java
bash -l $BASEDIR/java/jdk8.sh
bash -l $BASEDIR/java/mvn3.sh


# Tomcat
export TOMCAT_DEV_CONTEXT=sample

bash -l $BASEDIR/tomcat/tomcat.sh
bash -l $BASEDIR/artifactory/artifactory.sh
bash -l $BASEDIR/gitbucket/gitbucket.sh
bash -l $BASEDIR/jenkins/jenkins.sh


# SonarQube
bash -l $BASEDIR/sonar/sonar.sh


# ruby 
export RUBY_VERSION=2.0.0-p643

bash -l $BASEDIR/ruby/ruby.sh


# redmine
export REDMINE_DB=redminedb
export REDMINE_USER=user_redmine
export REDMINE_PASS=pass

export REDMINE_PATH=/var/lib
export REDMINE_VER=2.3.2

bash -l $BASEDIR/redmine/redmine.sh
bash -l $BASEDIR/redmine/redmine_code_review.sh
bash -l $BASEDIR/redmine/backlogs.sh
bash -l $BASEDIR/redmine/github_hook_plugin.sh
bash -l $BASEDIR/redmine/passenger.sh


# terminate
bash -l $BASEDIR/base/cleanup.sh
bash -l $BASEDIR/base/zerodisk.sh
