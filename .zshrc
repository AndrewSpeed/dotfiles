source ~/.profile
source ~/.zplug/init.zsh

zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=0

# Load the theme.
zplug 'halfo/lambda-mod-zsh-theme', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# provide utility to query gitignore.io for gitignore contents
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# alias vi to vim
alias vi=vim

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aspeed/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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

xmodmap ~/.xmodmaprc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.scripts/fzf.zsh
