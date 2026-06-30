if [[ "$(whence mise)" > /dev/null ]]; then
    eval "$(mise activate zsh)"
else
    echo "mies not installed"
fi
