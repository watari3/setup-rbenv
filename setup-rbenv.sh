#!/bin/bash

function puts_required_apt {
    echo "Install the following packages"
    echo "sudo apt install gcc libssl-dev libreadline-dev autoconf zlib1g-dev make "

}
function puts_required_yum {
    echo "Install the following packages"
    echo "sudo yum install gcc libssl-dev libreadline-dev autoconf zlib1g-dev make "
}


export RBENV_HOME=${HOME}/.rbenv
DIST=`lsb_release -i | awk '{print $3}'`

if [ ${DIST} = "Debian" ]; then
    puts_required_apt
fi
if [ ${DIST} = "Ubuntu" ]; then
    puts_required_apt
fi
if [ ${DIST} = "CentOS" ]; then
    puts_required_yum
fi

if [ -e $RBENV_HOME ]; then
    echo "Exist $RBENV_HOME"
else
    git clone https://github.com/rbenv/rbenv.git $RBENV_HOME
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bashrc
    echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
fi

if [ -e $RBENV_HOME/plugins ]; then
    echo "Exist $RBENV_HOME/plugins"
else
    mkdir -p $RBENV_HOME/plugins
fi

if [ -e $RBENV_HOME/plugins/ruby-build ]; then
    echo "Exist $RBENV_HOME/ruby-build"
else
    git clone git://github.com/sstephenson/ruby-build.git $RBENV_HOME/plugins/ruby-build
fi

if [ -e $RBENV_HOME/plugins/rbenv-update ]; then
    echo "Exist $RBENV_HOME/ruby-update"
else
    git clone https://github.com/rkh/rbenv-update.git $RBENV_HOME/plugins/rbenv-update
fi
