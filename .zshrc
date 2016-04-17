source ~/.profile
source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).

antigen bundles <<EOBUNDLES
  command-not-found
  docker
  screen
  sudo
  vagrant
  zsh-users/zsh-syntax-highlighting

  python

  git
  gitignore
  git-extras

  scala

  unixorn/autoupdate-antigen.zshplugin
EOBUNDLES

# Apt
alias aS='apt-cache search'
alias aI='sudo apt install -y'
alias aUd='sudo apt update -y'
alias aUg='sudo apt upgrade -y'
alias aR='sudo apt remove -y'

# Yum
alias yumc='sudo yum clean all'
alias yumi='sudo yum install'
alias yuml='repoquery --list'
alias yumq='yum info'
alias yums='yum search'
alias yumu='sudo yum update'
alias yumU='sudo yum upgrade'
alias yumx='sudo yum erase'

# Load the theme.
antigen theme https://github.com/halfo/lambda-mod-zsh-theme lambda-mod

# Tell antigen that you're done.
antigen apply

# provide utility to query gitignore.io for gitignore contents
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# alias vi to vim
alias vi=vim

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch correct_all
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aspeed/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

