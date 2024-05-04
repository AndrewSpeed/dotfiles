#!/bin/bash
set -euo pipefail

stow --target="$HOME" --verbose "$@"
