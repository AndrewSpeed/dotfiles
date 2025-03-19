if [[ "$(whence autojump)" > /dev/null ]]; then
    # *nix: load appropriate shellscript for our shell
    [ -f /usr/share/autojump/autojump.$(basename "$SHELL") ] && . /usr/share/autojump/autojump.$(basename "$SHELL")

    # macos
    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh # load autojump
else
    echo "Autojump not installed, skipping configuration"
fi
