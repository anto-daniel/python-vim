#!/bin/bash

pythonv=`ls ${HOME}/.local/lib/ | egrep python`
cd ${HOME}/.local/lib/$pythonv/site-packages/powerline/bindings/vim && path=$(pwd)
cd ${HOME}
cat >> .vimrc << EOM
set rtp+=${path}
set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set t_Co=256
let g:Powerline_symbols = "fancy"
"let g:Powerline_symbols = "compatible"
let g:Powerline_cache_enabled = 1
set guifont=PowerlineSymbols
EOM
cd && userpath=$(pwd)
user=` echo $userpath | cut -d/ -f3`
chown -R $user:users $HOME/.vim
chown -R $user:users $HOME/.vimrc
chmod -R 755 $HOME/.vim*
cd ${HOME}/.local/bin
for i in `ls ${HOME}/.local/bin`
do
    ln -s ${HOME}/.local/bin/$i /usr/local/bin
done
chown -R $user:users $HOME/.vim
chown -R $user:users $HOME/.vimrc
chmod -R 755 $HOME/.vim*
chown -R $user:users ${HOME}/.local/
