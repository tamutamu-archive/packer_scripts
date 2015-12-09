echo "Install Apache Maven 3"

##################################################
# Apache Maven 3                                 #
##################################################
cd /tmp
wget http://www.eu.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.zip
unzip -q apache-maven-3.3.3-bin.zip
mv apache-maven-3.3.3 /opt/maven
ln -s /opt/maven/bin/mvn /usr/bin/mvn

cat << 'EOT' >> /etc/profile.d/maven.sh
export MAVEN_HOME=/opt/maven
export PATH=$PATH:$MAVEN_HOME/bin
EOT

. /etc/profile.d/maven.sh
