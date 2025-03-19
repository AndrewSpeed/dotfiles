if [[ "$(whence fzf)" > /dev/null ]]; then
    # Set up fzf key bindings and fuzzy completion
    source <(fzf --zsh)
else
    echo "fzf not installed, skipping configuration"
fi
