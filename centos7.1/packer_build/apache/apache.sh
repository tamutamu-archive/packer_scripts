echo 'Install Apache'
yum -y install httpd httpd-devel libcurl-devel apr-util-devel apr-devel mod_ssl

systemctl enable httpd.service
systemctl start httpd.service
