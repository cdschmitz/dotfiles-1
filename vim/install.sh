#!/usr/bin/env bash

vundle_dir="$HOME/.vim/bundle/Vundle.vim"
if ! [[ -d "$vundle_dir" ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall > /dev/null
fi
