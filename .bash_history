pkg up -y
pkg i git -y
pkg i lynx -y
pkg i nnn -y
pkg i tmux -y
pkg i vim -y
pkg i man
ln -s $HOME/dotfiles/.termux $HOME/.termux
git config --global user.name "Cedric Priestley"
git config --global user.email cedricpriestley@gmail.com
EDITOR=vim
git config credential.https://example.com.username myusername
git config credential.https://example.com.username myusername
git config --global credential.https://github.com/cedricpriestley/linux-dotfiles.cedricpriestley
git config --global --edit
git config --global --unset core.askpass
git config --global credential.helper 'cache --timeout=3600'
git config --global credential.helper store
