#!/usr/bin/env bash

DOTFILES="$HOME/Nvim-config"

mkdir -p "$HOME/.config/tmux"

ln -sf "$DOTFILES/tmux/tmux.conf" \
       "$HOME/.config/tmux/tmux.conf"

git submodule update --init --recursive

"$DOTFILES/tmux/plugins/tpm/bin/install_plugins"
