#!/bin/bash


cd /usr/local/lib/python2.7/dist-packages/powerline_status-dev_*-py2.7.egg/powerline/bindings/vim && path=$(pwd)
cd ${HOME}
cat >> .vimrc << EOM
set rtp+=${path}
EOM
cd && userpath=$(pwd)
user=` echo $userpath | cut -d/ -f3`
chown -R $user:$user $HOME/.vim
chown -R $user:$user $HOME/.vimrc
chmod -R 755 $HOME/.vim*
