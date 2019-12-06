#!/bin/sh

pkg up -y

pkg i bat fzf git htop nnn termux-api tmux vim zsh -y 

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions

git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

git clone https://github.com/cedricpriestley/linux-dotfiles.git $HOME/dotfiles

ln -s $HOME/dotfiles/.termux $HOME/.termux
ln -s $HOME/dotfiles/.vim $HOME/.vim

echo "zstyle ':completion:*' menu select" >> $HOME/.zshr
c
echo "source $HOME/dotfiles/aliases.sh" >> $HOME/.zshrc
 
echo "source $HOME/dotfiles/envars.sh" >> $HOME/.zshrc
 
git config --global user.name "Cedric Priestley"
git config --global user.email cedricpriestley@gmail.com
git config --global credential.helper store
