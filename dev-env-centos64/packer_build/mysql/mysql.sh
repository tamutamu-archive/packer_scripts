sudo yum -y install $MYSQL_IMPL-server mysql-devel
sudo service ${MYSQL_IMPL}d start
sudo chkconfig ${MYSQL_IMPL}d on
/usr/bin/mysqladmin -u root password $MYSQL_ROOT_PASSWORD
