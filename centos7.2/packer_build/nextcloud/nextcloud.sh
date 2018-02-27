#!/bin/bash


yum -y install epel-release

rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y install httpd php70w php70w-dom php70w-mbstring php70w-gd php70w-pdo php70w-json php70w-xml php70w-zip php70w-curl php70w-mcrypt php70w-pear php70w-opcache setroubleshoot-server bzip2


### MySQL
yum -y install mariadb-server php70w-mysql
systemctl start mariadb
systemctl enable mariadb

echo -e "\n\npassword\npassword\n\n\nn\n\n " | mysql_secure_installation 2>/dev/null


### Nextcloud
# Database
mysql -uroot -ppassword <<EOF
CREATE DATABASE nextcloud;
CREATE USER 'nc_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nc_user'@'localhost';
FLUSH PRIVILEGES;
EOF

#Nextcloud
cd /var/www/html
curl -o nextcloud-12-latest.tar.bz2 https://download.nextcloud.com/server/releases/latest-12.tar.bz2
tar -xvjf nextcloud-12-latest.tar.bz2
mkdir nextcloud/data
chown -R apache:apache nextcloud
rm -f nextcloud-12-latest.tar.bz2

cp ./nextcloud.conf /etc/httpd/conf.d/
