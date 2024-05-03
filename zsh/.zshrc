source ~/.profile
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=0

# alias vi to vim
alias vi=vim

zstyle :compinstall filename '/home/andrewspeed/.zshrc'

# load all profile scripts
for file in $HOME/.profile_scripts/*; do
  source $file;
done

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
