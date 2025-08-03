# load zsh plugin manager
# https://github.com/mattmc3/antidote

# uncomment for profiling
# zmodload zsh/zprof

if command -v brew &> /dev/null
then
    if [ ! -d "$(brew --prefix)/opt/antidote" ]
    then
        echo "Antidote not installed, installing via brew"
        brew install antidote
    fi
    source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
else
    if [ ! -d "$HOME/.antidote" ]
    then
        echo "Antidote not installed, cloning repo into ${ZDOTDIR:-$HOME}"
        git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-$HOME}/.antidote"
    fi
    source "${ZDOTDIR:-$HOME}/.antidote/antidote.zsh"
fi

# disable zsh async git prompt, breaks shell integration with theme
zstyle ':omz:alpha:lib:git' async-prompt no

fpath+=${ZDOTDIR:-~}/.zsh_functions

# enable completions
autoload -Uz compinit && compinit

# install plugins
antidote load

# highlight suggestion
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#000000,bg=#ffffff,bold,underline,memo=zsh-autosuggestions-test"

source ~/.profile

# configure homebrew if present
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     BREW_BIN_HOME="/home/linuxbrew/.linuxbrew/bin";;
    Darwin*)    BREW_BIN_HOME="/opt/homebrew/bin";;
esac
if [[ -f "$BREW_BIN_HOME/brew" ]]
then
    eval "$($BREW_BIN_HOME/brew shellenv)"
    export PATH="$HOMEBREW_CELLAR:$PATH"
fi

# load all env scripts
if [ -d "$HOME/.env_scripts" ]
then
    for file in "$HOME/.env_scripts"/*.sh; do
        source "$file";
    done
fi

# uncomment for profiling
# zprof
