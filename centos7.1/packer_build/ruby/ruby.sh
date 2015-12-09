echo "Install Ruby(rbenv)"

##################################################
# Ruby2.0                                        #
##################################################

yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel \
               libcurl-devel ImageMagick ImageMagick-devel libyaml-devel \
               libffi-devel openssl-devel make bzip2 autoconf automake libtool bison
               

if [ ! $(which git) ]; then
  echo "Git is not installed."
  exit
fi


RBENV_ROOT="/usr/local/rbenv"
PROFILE="/etc/profile.d/rbenv.sh"


# Install rbenv:
if [ ! -f $RBENV_ROOT/bin/rbenv ] ; then
  git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT
fi

# Install rbenv plugins:
if [ ! -d $RBENV_ROOT/plugins/rbenv-vars ] ; then
  git clone https://github.com/sstephenson/rbenv-vars.git $RBENV_ROOT/plugins/rbenv-vars
fi

# Add rbenv to the path:
cat << EOF > $PROFILE
# rbenv setup
export RBENV_ROOT=$RBENV_ROOT
export PATH=$RBENV_ROOT/bin:\$PATH
eval "\$(rbenv init -)"
EOF

# Install ruby-build:
if [ ! -f $RBENV_ROOT/bin/ruby-build ] ; then
  pushd $(mktemp -d /tmp/ruby-build.XXXXXXXXXX)
    git clone https://github.com/sstephenson/ruby-build.git
    cd ruby-build
    PREFIX=$RBENV_ROOT ./install.sh
  popd
fi


cat << EOF > /etc/sudoers.d/rbenv
Defaults env_keep += "RBENV_ROOT"
EOF


. $PROFILE
rbenv install -v $RUBY_VERSION
rbenv global $RUBY_VERSION
gem install bundler --no-rdoc --no-ri
rbenv rehash
