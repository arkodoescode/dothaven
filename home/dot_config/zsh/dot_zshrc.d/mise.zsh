#!/bin/zsh

(( $+commands[mise] )) || return 1

export MISE_DATA_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/mise
export MISE_CACHE_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/mise
export MISE_CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/mise
export MISE_GLOBAL_CONFIG_FILE=${MISE_CONFIG_DIR:-$HOME/.config/mise}/config.toml

eval "$(mise activate zsh)"