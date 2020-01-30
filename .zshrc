# zmodload zsh/zprof # enable profiling
# module_path+=( "/Users/andrewspeed/.zplugin/mod-bin/zmodules/Src" )
# zmodload zdharma/zplugin

alias vi=vim

# load all profile scripts
# for file in $HOME/.profile_scripts/*; do
#   source $file;
# done

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory autocd extendedglob hist_ignore_all_dups nomatch
bindkey -e

# Add homebrew and Cellar directories to path
export PATH="/usr/local/Homebrew/bin:/usr/local/opt/openssl/bin:/usr/local/bin:$PATH"

### Added by Zplugin's installer
source '/Users/aspeed/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# https://github.com/zdharma/zplugin#calling-compinit-with-turbo-mode
zplugin ice atinit'zpcompinit' wait''; zplugin load zsh-users/zsh-syntax-highlighting
zplugin load zsh-users/zsh-autosuggestions

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=0
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Load the theme.
# https://github.com/zdharma/zplugin/issues/146
setopt prompt_subst
autoload colors
colors
# https://github.com/halfo/lambda-mod-zsh-theme/issues/23
zplugin snippet OMZ::lib/git.zsh
zplugin ice pick"lambda-mod.zsh-theme"; zplugin light halfo/lambda-mod-zsh-theme 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# required to use brew python instead of system python
PATH="/Users/aspeed/Library/Python/3.7/bin:/usr/local/opt/python/libexec/bin:$PATH"
PATH="/usr/local/opt/python@3.8/bin:$PATH"

# required to use brew ruby instead of system ruby
PATH="/usr/local/opt/ruby/bin:$PATH"
PATH="~/.gem/bin:$PATH"

eval "$(direnv hook zsh)"

# docker-compse aliases
alias dc="docker-compose"
alias dct="docker-compose -f docker-compose.test.yml"

# required to allow prompt for GPG passphrase
export GPG_TTY=$(tty)

# set ruby environment so gems can be installed without sudo
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# add cargo to the PATH
export PATH=$HOME/.cargo/bin:$PATH

# zpmod source-study # duration of each sourced file
# zprof # complete profiling
# update_dotfiles
