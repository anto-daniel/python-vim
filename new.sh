#!/bin/bash


cd /usr/local/lib/python2.7/dist-packages/powerline_status-dev_*-py2.7.egg/powerline/bindings/vim && path=$(pwd)
cd ${HOME}
cat >> .vimrc << EOM
set rtp+=${path}
EOM
