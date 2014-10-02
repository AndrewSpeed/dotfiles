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

# Load the theme.
antigen theme gallifrey

# Tell antigen that you're done.
antigen apply

export SCALA_HOME=/usr/local/share/scala
export PATH=$PATH:$SCALA_HOME/bin

