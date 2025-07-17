#!/bin/bash

export PATH="$HOME/.local/bin/:$PATH"

# hook direnv into shell
eval "$(direnv hook $(basename `which "$SHELL"`))"
