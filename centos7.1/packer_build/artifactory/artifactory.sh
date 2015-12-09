cd /tmp
curl -L -O https://bintray.com/artifact/download/jfrog/artifactory/jfrog-artifactory-oss-4.3.0.zip
unzip -q jfrog-artifactory-oss-4.3.0.zip
mv artifactory-oss-4.3.0/webapps/artifactory.war $CATALINA_HOME/webapps/
