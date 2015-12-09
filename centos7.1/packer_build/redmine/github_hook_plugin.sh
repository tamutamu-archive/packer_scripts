echo "Install github_fook_plugin"

##################################################
# github_fook_plugin                            #
##################################################

cd /$REDMINE_PATH/redmine-$REDMINE_VER
echo 'gem "redmine_github_hook"' >> Gemfile.local
bundle install
