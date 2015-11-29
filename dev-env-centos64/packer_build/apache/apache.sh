echo 'Install Apache'
sudo yum -y install httpd httpd-devel libcurl-devel apr-util-devel apr-devel mod_ssl
sudo chkconfig httpd on
sudo service httpd start