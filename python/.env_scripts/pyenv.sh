#!/bin/bash

export PYENV_ROOT="$HOME/.pyenv"

# Load pyenv automatically:
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if [[ "$(whence pyenv)" > /dev/null ]]; then
    eval "$(pyenv init -)"

    # Load pyenv-virtualenv automatically:
    eval "$(pyenv virtualenv-init -)"
else
    echo "pyenv not installed, skipping configuration"
fi
