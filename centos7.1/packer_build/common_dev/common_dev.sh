cd /tmp

yum -y groupinstall "Development Tools"
yum install -y wget zip unzip vim subversion telnet
yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker

# Git Install
yum -y remove git
wget https://www.kernel.org/pub/software/scm/git/git-2.4.0.tar.gz
tar zxf git-2.4.0.tar.gz
cd git-2.4.0
make prefix=/usr/local all
make prefix=/usr/local install

if [ -n "$http_proxy" ]; then
  git config --global http.proxy $http_proxy
  git config --global https.proxy $http_proxy
fi
