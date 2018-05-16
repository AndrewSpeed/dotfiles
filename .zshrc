source ~/.profile
source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).

antigen bundles <<EOBUNDLES
  command-not-found
  docker
  sudo
  zsh-users/zsh-syntax-highlighting

  python

  git
  gitignore
  git-extras

  zsh-users/zsh-autosuggestions

  unixorn/autoupdate-antigen.zshplugin
EOBUNDLES

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=0

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

source ~/.profile

# exercism CLI zsh completion
if [ -n "$ZSH_VERSION" ] && [ -f ~/.config/exercism/exercism_completion.zsh ]; then
    . ~/.config/exercism/exercism_completion.zsh
fi

# colourise man page entries
# https://gist.github.com/cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

alias git="nocorrect git"
alias fd="nocorrect fd"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.scripts/fzf.sh
