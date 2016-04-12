# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

# need for correct gruvbox scheme in vim
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

autoload -Uz compinit
compinit

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

bindkey '^J' down-line-or-history
bindkey '^K' up-line-or-history

export TERM=xterm-256color
export KEYTIMEOUT=20
export MODE_INDICATOR="%{$fg_bold[red]%}%{$fg[red]%}%{$reset_color%}"

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git dirhistory docker history sbt scala sudo wd ssh-agent vi-mode)
source $ZSH/oh-my-zsh.sh

# rehash after install new application
zstyle ':completion:*' rehash true

# disable ctrl-s in vim
stty -ixon

# colored dirs
eval $(dircolors ~/.dircolors)

# key bindings
alias ls='ls --color=auto'
alias ll='ls -l'
alias sv='sudo vim'
alias gs='git status'
alias gc='git commit -am'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
