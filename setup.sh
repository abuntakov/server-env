#!/bin/bash

ln -f -s "`pwd`/zshrc" ~/.zshrc
ln -f -s "`pwd`/vimrc" ~/.vimrc
ln -f -s "`pwd`/dircolors" ~/.dircolors

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

chsh -s /bin/zsh
