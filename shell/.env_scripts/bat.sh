if [[ "$(whence fzf)" > /dev/null ]]; then
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
else
    echo "bat not installed, skipping configuration"
fi
