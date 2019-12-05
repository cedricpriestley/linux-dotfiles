#!/bin/sh
 
pkg up -y
pkg i git zsh -y
pkg i bat fzf git nnn tmux vim -y
  
cd $HOME

git config --global user.name "Cedric Priestley"
git config --global user.email cedricpriestley@gmail.com
git config --global credential.helper store
 
git clone https://github.com/cedricpriestley/linux-dotfiles.git dotfiles
ln -s $HOME/dotfiles/.termux $HOME/.termux
ln -s $HOME/dotfiles/.vim $HOME/.vim
 
echo "source $HOME/dotfiles/aliases.sh" >> $HOME/.zshr
 
echo "source $HOME/dotfiles/envars.sh" >> $HOME/.zshr
 
chmod u+x $HOME/dotfiles//scripts/install.sh
 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
