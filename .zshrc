source ~/.profile
source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).

antigen bundles <<EOBUNDLES
  command-not-found
  docker
  heroku
  screen
  sudo
  vagrant
  zsh-users/zsh-syntax-highlighting

  django
  pip
  python
  virtualenv
  virtualenvwrapper

  git
  gitignore
  git-extras

  scala
EOBUNDLES

# Yum
alias yumc='sudo yum clean all'
alias yumi='sudo yum install'
alias yuml='repoquery --list'
alias yumq='yum info'
alias yums='yum search'
alias yumu='sudo yum update'
alias yumU='sudo yum upgrade'
alias yumx='sudo yum erase'

# vi to vim
alias vi='vim'

# Load the theme.
antigen theme gallifrey

# Tell antigen that you're done.
antigen apply

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

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
