echo "Install Oracle JDK8"

##################################################
# Oracle JDK 8                                   #
##################################################
cd /tmp
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.rpm -O /tmp/jdk-8u65-linux-x64.rpm
rpm -ivh jdk-8u65-linux-x64.rpm

cat << 'EOT' >> /etc/profile.d/java_env.sh
export JAVA_HOME=/usr/java/default
export JRE_HOME=/usr/java/default
export PATH=$PATH:$JAVA_HOME/bin
EOT

. /etc/profile.d/java_env.sh
