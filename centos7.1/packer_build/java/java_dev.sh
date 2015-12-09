yum remove -y java-*

cd /tmp

##### oracle Java 8 #####
#wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.rpm -O /tmp/jdk-8u65-linux-x64.rpm
#rpm -ivh jdk-8u65-linux-x64.rpm


#cat << 'EOT' >> /etc/profile.d/java_env.sh
#export JAVA_HOME=/usr/java/default
#export JRE_HOME=/usr/java/default
#export PATH=$PATH:$JAVA_HOME/bin
#EOT

#. /etc/profile.d/java_env.sh


##### open jdk 8 #####
yum install -y java-1.8.0-openjdk-devel

echo 'export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")' > /etc/profile.d/jdk.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile.d/jdk.sh
. /etc/profile.d/jdk.sh


# Maven
cd /opt
wget http://www.eu.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.zip
unzip -q apache-maven-3.3.3-bin.zip
mv apache-maven-3.3.3 maven
ln -s /opt/maven/bin/mvn /usr/bin/mvn

cat << 'EOT' >> /etc/profile.d/maven.sh
export MAVEN_HOME=/opt/maven
export PATH=$PATH:$MAVEN_HOME/bin
EOT

chmod +x /etc/profile.d/maven.sh
. /etc/profile.d/maven.sh


# Gradle
wget --no-check-certificate https://services.gradle.org/distributions/gradle-2.0-all.zip
unzip -q gradle-2.0-all.zip -d /opt/gradle
ln -s /opt/gradle/gradle-2.0 /opt/gradle/latest
printf "" > /etc/profile.d/gradle.sh

cat << 'EOT' >> /etc/profile.d/gradle.sh
export GRADLE_HOME=/opt/gradle/latest
export PATH=$PATH:$GRADLE_HOME/bin
EOT

. /etc/profile.d/gradle.sh
