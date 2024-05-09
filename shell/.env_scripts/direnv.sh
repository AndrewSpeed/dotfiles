#!/bin/bash

# hook direnv into shell
eval "$(direnv hook $(basename `which "$SHELL"`))"
