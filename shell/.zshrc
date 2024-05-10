# load zsh plugin manager
# https://github.com/mattmc3/antidote
if command -v brew &> /dev/null
then
    source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
else
    source "$HOME/.antidote/antidote.zsh"
fi

# disable zsh async git prompt, breaks shell integration with theme
zstyle ':omz:alpha:lib:git' async-prompt no

# enable completions
autoload -Uz compinit && compinit

# install plugins
antidote load

# highlight suggestion
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#000000,bg=#ffffff,bold,underline"

# load all env scripts
if [ -d "$HOME/.env_scripts" ]
then
    for file in "$HOME/.env_scripts"/*.sh; do
        source "$file";
    done
fi

source ~/.profile
