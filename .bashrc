alias c='clear'
alias ls='ls -aF --color'
alias ..='cd ../'
alias nsess='tmux new -s'
alias asess='tmux attach -t'
alias ksess='tmux kill-session -t'
alias lsess='tmux list-sessions'
alias csess='tmux switch -t'
# alias nwind='tmux new-window'
# alias swind='tmux select-window -t :'
# alias rwind='tmux rename-window'
alias isess='tmux info'
alias x='exit'
alias ll='ls -al --color'
alias n='nnn'
alias rm='rm -iv'
alias wget='wget -c'
alias grep='grep --color=auto'
alias mkdir="mkdir -p"

EDITOR=vim

mkcd() { mkdir -p $1; cd $1 }

alias editbash='vim ~/.bashrc'
alias updatebash='source ~/.bashrc'
# alias ls='ls -alC --color=auto'

function search (){
 egrep -roiI $1 . | sort | uniq
}

function whereis (){
  find . -name "$1*";
}

# Find What is Using a Particular Port
  # USAGE: $ whoisport 80
function whoisport (){
        port=$1
        pidInfo=$(fuser $port/tcp 2> /dev/null)
        pid=$(echo $pidInfo | cut -d':' -f2)
        ls -l /proc/$pid/exe
}

function mysql-import (){
  if [ $# -lt 2 ];
  then
    echo 'mysql-import {DB-NAME} {SQL-FILE}';
  else
    mysql $1 < $2;
  fi
}

# Tail Files in Directory
  # USAGE: $ log {arg1:file filter(opt)} {arg2:string filter(opt)}
function log (){
 if [ $# -lt 1 ];
 then
  tail -f *
 fi

 if [ $# -gt 1 ];
 then
  tail -f $1 | grep --line-buffered "$2"
 else
  tail -f $1
 fi
}

alias df="df -Tha --total"

alias du="du -ach | sort -h"

alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

# fd - Find any directory and cd to selected directory
fd() {
 local dir
 dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
      -print 2> /dev/null | fzf +m) &&
 cd "$dir"
}



