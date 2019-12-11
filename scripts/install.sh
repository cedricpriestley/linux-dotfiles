#!/bin/sh

pkg up -y

# pkg i bat fzf git nodejs-lts silversearcher-ag man proot nnn termux-api tmux vim nano openssh ripgrep -y 

pkg i autotools curl zlib openssl expat libiconv
# git build requirements - autotools, curl, zlib, openssl, expat, and libiconv
curl -o git-2.24.1.tar.gz https://github.com/git/git/archive/v2.24.1.tar.gz
tar -zxf git-2.24.1.tar.gz
cd git-2.24.1
make configure
./configure --prefix=/usr
# make all doc info
make install install-doc install-html install-info

# Clone the repo.containing the init & install scripts and default dotfile configuration
git clone https://github.com/cedricpriestley/linux-dotfiles.git $HOME/dotfiles

ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# Termux-specific configuration
ln -s $HOME/dotfiles/.termux $HOME/.termux
 
git config --global user.name "Cedric Priestley"
git config --global user.email cedricpriestley@gmail.com
git config --global credential.helper store

ssh-keygen -t rsa -b 4096
