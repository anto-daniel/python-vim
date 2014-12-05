#!/bin/bash 
sudo apt-get install python gcc wget fontconfig socat -y
sudo pip install psutil
sudo pip install mercurial
sudo pip install pygit2
sudo pip install pygit
sudo pip install bzr
sudo pip install pyuv
git clone https://github.com/ziberna/i3-py.git
cd i3-py && python setup.py build && sudo python setup.py install
pip install --user git+git://github.com/Lokaltog/powerline
sudo pip install powerline-status
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
