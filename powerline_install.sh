#!/bin/bash 
sudo apt-get install python gcc wget fontconfig socat -y
pip install --user psutil
pip install --user mercurial
pip install --user pygit2
pip install --user pygit
pip install --user bzr
pip install --user pyuv
pip install --user i3-py
pip install --user git+git://github.com/Lokaltog/powerline
pip install --user powerline-status
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
powerline-daemon -q
cat >> $HOME/.bashrc << EOM
export PATH=$PATH:$HOME/.local/bin
source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
EOM
source ~/.bashrc
