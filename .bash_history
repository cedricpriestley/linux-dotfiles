pkg up -y
pkg i git -y
pkg i man
pkg i nnn -y
pkg i tmux -y
pkg i vim -y
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.bash_history $HOME/.bash_history
ln -s $HOME/dotfiles/.termux $HOME/.termux
ln -s $HOME/dotfiles/.vim $HOME/.vim
git config user.name "Cedric Priestley"
git config user.email cedricpriestley@gmail.com
git config --edit
git config credential.helper 'cache --timeout=3600'
