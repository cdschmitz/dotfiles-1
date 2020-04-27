#!/usr/bin/env bash

cd "$(dirname $0)"

target_dir="$HOME/powerline-fonts"
if ! [[ -d "$target_dir" ]]; then
    git clone https://github.com/powerline/fonts.git --depth=1 "$target_dir"
    cd "$target_dir"
    ./install.sh
fi
