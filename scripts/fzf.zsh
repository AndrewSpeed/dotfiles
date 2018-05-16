#!/usr/local/bin/zsh

# modified version of script from: https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings#zsh
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}

zle -N fzf-history-widget-accept
bindkey '^R' fzf-history-widget-accept
