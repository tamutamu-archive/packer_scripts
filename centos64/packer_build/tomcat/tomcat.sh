echo 'Installing Tomcat'

CURDIR=$(cd $(dirname $0); pwd)

# Tomcat7
TOMCAT_HOME=/var/lib/tomcat7

cd /tmp
wget http://ftp.riken.jp/net/apache/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.tar.gz
tar xzf apache-tomcat-7.0.65.tar.gz

mv apache-tomcat-7.0.65 /var/lib
mv /var/lib/apache-tomcat-7.0.65 $TOMCAT_HOME

# Create user for tomcat
useradd -d $TOMCAT_HOME/data tomcat

mkdir -p /var/run/tomcat7
chown tomcat:tomcat /var/run/tomcat7 -R

cat << EOT >> /etc/profile.d/tomcat7.sh
export CATALINA_HOME=$TOMCAT_HOME
export CATALINA_BASE=$TOMCAT_HOME
export CATALINA_PID=/var/run/tomcat7/catalina.pid
export CATALINA_OPTS="-server -Xms1000m -Xmx1300m -XX:NewRatio=2 -XX:SurvivorRatio=25 -XX:+UseParallelGC -XX:ParallelGCThreads=2 -Dhudson.model.DownloadService.noSignatureCheck=true"
EOT

. /etc/profile.d/tomcat7.sh


# Config develop webapps
pushd $TOMCAT_HOME
mkdir -p Catalina/localhost
cp $CURDIR/conf/localhost_context/* Catalina/localhost/
sed -i -e 's/\$CONTEXT/$TOMCAT_DEV_CONTEXT/g' Catalina/localhost/dev_context.xml
popd

chown tomcat:tomcat $TOMCAT_HOME -R


# init.d
cp $CURDIR/conf/tomcat7 /etc/init.d/
chmod 755 /etc/init.d/tomcat7
chkconfig --add tomcat7
chkconfig tomcat7 on


# Apache+Tomcat
cp $CURDIR/conf/tomcat_proxy.conf /etc/httpd/conf.d/
