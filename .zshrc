# zmodload zsh/zprof # enable profiling
# module_path+=( "/Users/andrewspeed/.zplugin/mod-bin/zmodules/Src" )
# zmodload zdharma/zplugin

alias vi=vim

# load all profile scripts
for file in $HOME/.profile_scripts/*; do
  source $file;
done

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory autocd extendedglob hist_ignore_all_dups nomatch
bindkey -e

# Add cargo, homebrew and Cellar directories to path
export PATH="$HOME/.cargo/bin:/usr/local/Cellar/qt@5.5/5.5.1_1/bin:/usr/local/Homebrew/bin:/usr/local/opt/openssl/bin:/usr/local/bin:$PATH"

### Added by Zplugin's installer
source '/Users/andrewspeed/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# https://github.com/zdharma/zplugin#calling-compinit-with-turbo-mode
zplugin ice atinit'zpcompinit' wait''; zplugin load zsh-users/zsh-syntax-highlighting
zplugin load zsh-users/zsh-autosuggestions

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=0
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=1

export NVM_DIR="/Users/andrewspeed/.nvm"
export NVM_LAZY_LOAD=true
zplugin load lukechilds/zsh-nvm

# Load the theme.
# https://github.com/zdharma/zplugin/issues/146
setopt prompt_subst
autoload colors
colors
# https://github.com/halfo/lambda-mod-zsh-theme/issues/23
zplugin snippet OMZ::lib/git.zsh
zplugin ice pick"lambda-mod.zsh-theme"; zplugin light halfo/lambda-mod-zsh-theme 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zpmod source-study # duration of each sourced file
# zprof # complete profiling
# update_dotfiles
