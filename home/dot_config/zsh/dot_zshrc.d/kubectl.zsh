#!/bin/zsh

(( $+commands[kubectl] )) || return 1
# kubectl autocompletion
source <(kubectl completion zsh)
