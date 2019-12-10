#!/bin/sh

pkg up -y

pkg i bat fzf git nodejs-lts silversearcher-ag man proot nnn termux-api tmux vim nano openssh ripgrep -y 

git clone https://github.com/cedricpriestley/linux-dotfiles.git $HOME/dotfiles

cp -r $HOME/dotfiles/.termux/* $HOME

ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
 
git config --global user.name "Cedric Priestley"
git config --global user.email cedricpriestley@gmail.com
git config --global credential.helper store

ssh-keygen -t rsa -b 4096
