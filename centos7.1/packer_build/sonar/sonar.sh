echo "Install SonarQube 5.2"

##################################################
# SonarQube                                #
##################################################

CURDIR=$(cd $(dirname $0); pwd)

wget -O /etc/yum.repos.d/sonar.repo http://downloads.sourceforge.net/project/sonar-pkg/rpm/sonar.repo
yum -y install sonar

# create database
psql -U postgres < $CURDIR/conf/init.sql


# init.d
\cp -f $CURDIR/conf/sonar.properties /opt/sonar/conf/ 
chkconfig enable sonar
service sonar start
