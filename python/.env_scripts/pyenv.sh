#!/bin/bash

export PYENV_ROOT="$HOME/.pyenv"

# Load pyenv automatically:
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if [[ -z "$DISABLE_PYENV" ]] || [[ "$DISABLE_PYENV" -eq 0 ]]; then
    if [[ "$(whence pyenv)" > /dev/null ]]; then
        eval "$(pyenv init -)"
    
        # Load pyenv-virtualenv automatically:
        eval "$(pyenv virtualenv-init -)"
    else
        echo "pyenv not installed, skipping configuration"
    fi
else
    echo "Skipping pyenv init due to DISABLE_PYENV"
fi
