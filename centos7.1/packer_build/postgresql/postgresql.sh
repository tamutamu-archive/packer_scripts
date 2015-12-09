echo "Install PostgreSQL9.4"

##################################################
# PostgreSQL9.4                                 #
##################################################

yum localinstall -y http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm
yum install -y postgresql94-server postgresql-libs postgresql-devel

cat << 'EOT' >> /etc/profile.d/postgres.sh
export POSTGRES_HOME=/usr/pgsql-9.4
export PGDATA=$POSTGRES_HOME/data
export PATH=$PATH:$POSTGRES_HOME/bin
EOT

. /etc/profile.d/postgres.sh

mkdir -p $PGDATA
chown postgres:postgres $POSTGRES_HOME -R


su - postgres -c 'initdb --encoding=UTF8 --no-locale'

echo "host    all    all       0.0.0.0/0            md5" >> $PGDATA/pg_hba.conf
echo "listen_addresses='*'" >> $PGDATA/postgresql.conf

systemctl enable postgresql-9.4.service
systemctl start postgresql-9.4.service
