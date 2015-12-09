echo "Install Redmine"

##################################################
# Redmine                                        #
##################################################

mkdir -p $REDMINE_PATH/redmine-$REDMINE_VER
cd $REDMINE_PATH
echo `pwd`

git clone https://github.com/redmine/redmine ./redmine-$REDMINE_VER/
cd redmine-$REDMINE_VER

git checkout -b local-$REDMINE_VER refs/tags/$REDMINE_VER

cp config/database.yml{.example,}
cp config/configuration.yml{.example,}

sed --in-place "s/adapter: mysql2.*/adapter: postgresql/g" config/database.yml
sed --in-place "s/username:.*/username: $REDMINE_USER/g" config/database.yml
sed --in-place "s/password:.*/password: $REDMINE_PASS/g" config/database.yml
sed --in-place "s/database:.*/database: $REDMINE_DB/g" config/database.yml


# PostgreSQL
psql -U postgres -c "create user $REDMINE_USER with password '$REDMINE_PASS';"
su - postgres -c "createdb -O $REDMINE_USER $REDMINE_DB"


bundle install --path vendor/bundle --without development test
bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV=production
RAILS_ENV=production bundle exec rake redmine:load_default_data REDMINE_LANG=ja
