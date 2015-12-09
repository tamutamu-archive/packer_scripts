echo "Install redmine_code_review"

##################################################
# redmine_code_review                            #
##################################################

cd /tmp
wget https://bitbucket.org/haru_iida/redmine_code_review/downloads/redmine_code_review-0.6.5.zip
unzip -q redmine_code_review-0.6.5.zip
mv redmine_code_review $REDMINE_PATH/redmine-$REDMINE_VER/plugins

cd $REDMINE_PATH/redmine-$REDMINE_VER
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
