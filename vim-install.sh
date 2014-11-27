#!/bin/bash

sudo -S apt-get install python-pip -y < pass
sudo -S pip install -U pip < pass

sudo -S pip install --user git+git://github.com/lokaltog/powerline < pass
cat >>  ~/.vimrc << EOM
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2
EOM
cd ~
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
mv PowelineSymbols.otf ~/.local/share/fonts/
sudo -S fc-cache -f -v < pass
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

# Create a per-user fontconfig folder if it doesn't already exist
mkdir -p ~/.config/fontconfig/fonts.conf
mv 10-powerline-symbols.conf ~/.config/fontconfig/fonts.conf/

