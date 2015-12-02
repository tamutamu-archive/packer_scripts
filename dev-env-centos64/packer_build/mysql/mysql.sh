yum -y install $MYSQL_IMPL-server mysql-devel
service ${MYSQL_IMPL}d start
chkconfig ${MYSQL_IMPL}d on
/usr/bin/mysqladmin -u root password $MYSQL_ROOT_PASSWORD
