#!/bin/bash

# *nix: load appropriate shellscript for our shell
[ -f /usr/share/autojump/autojump.$(basename "$SHELL") ] && . /usr/share/autojump/autojump.$(basename "$SHELL")

# macos
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh # load autojump
