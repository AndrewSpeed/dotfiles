if [[ "$(whence zoxide)" > /dev/null ]]; then
    eval "$(zoxide init zsh)"
else
    print "zoxide not installed, skipping configuration"
fi
