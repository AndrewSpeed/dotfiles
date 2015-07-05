#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# get the sublime directory relative to this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/sublime"

# link each config file to it's corresponding location in /opt/sublime_text_3
for file in $( find $SCRIPT_DIR -type f );
do
  filename=$(basename $file)

    echo "linking /opt/sublime_text_3/Packages/User/$filename to $file"
    `sudo ln -fs $file ~/.config/sublime-text-3/Packages/User/$filename`
done

IFS=$SAVEIFS
