#!/bin/bash

export PYENV_ROOT="$HOME/.pyenv"

# Load pyenv automatically:
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load pyenv-virtualenv automatically:
eval "$(pyenv virtualenv-init -)"
