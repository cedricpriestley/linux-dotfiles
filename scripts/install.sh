#!/bin/sh

pkg up -y

pkg i bat fzf git nodejs-lts silversearcher-ag man proot nnn termux-api tmux vim zsh -y 

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/cedricpriestley/linux-dotfiles.git $HOME/dotfiles

mv $HOME/.termux/* $HOME/dotfiles/.termux/
rm -fr $HOME/.termux
ln -s $HOME/dotfiles/.termux $HOME/.termux
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

echo "zstyle ':completion:*' menu select" >> $HOME/.zshrc

echo "source $HOME/dotfiles/aliases.sh" >> $HOME/.zshrc
 
echo "source $HOME/dotfiles/envars.sh" >> $HOME/.zshrc
 
git config --global user.name "Cedric Priestley"
git config --global user.email cedricpriestley@gmail.com
git config --global credential.helper store
