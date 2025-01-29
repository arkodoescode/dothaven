#!bin/sh

(( $+commands[fzf] )) || return 1

# use fd instead of find for fzf
# view files and previews
FZF_DEFAULT_COMMAND="fd --hidden --type=f --strip-cwd-prefix --exclude .git -d 4"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_CTRL_T_OPTS="\
# --gap
--style full
--height 90%
--border sharp
--padding 1
--input-label ' search ' --header-label ' type '
--preview 'bat -n --color=always --style=numbers --line-range=:100 {}'
--bind 'enter:execute:${EDITOR:-vi} {}'
--bind 'focus:+transform-preview-label:[[ -n {} ]] && basename {}'
--bind 'focus:+transform-header:file --brief {}'
--color 'input-border:#996666,input-label:#ffcccc'
--color 'header-border:#6699cc,header-label:#99ccff'
--color 'preview-border:#9999cc,preview-label:#ccccff'
"
# view dirs and cd into dir
FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
FZF_ALT_C_OPTS="\
--style full
--height 90%
--border sharp
--padding 1
--input-label ' search ' --header-label ' type '
--preview 'eza --tree --icons=always --color=always --level=3 {}'
--bind 'focus:+transform-preview-label:[[ -n {} ]] && basename {}'
--bind 'focus:+transform-header:file --brief {}'
--color 'input-border:#996666,input-label:#ffcccc'
--color 'header-border:#6699cc,header-label:#99ccff'
--color 'preview-border:#9999cc,preview-label:#ccccff'
"

FZF_CTRL_R_OPTS="\
--gap
--style full
--height 50%
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--list-label 'CTRL-Y to copy into clipboard'
--color 'input-border:#996666,input-label:#ffcccc'
"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift

#   case "$command" in
#     cd)           fzf --height=85% --border --preview 'eza --tree --color=always {} | head -200' --preview-window=up,45%   "$@" ;;
#     export|unset) fzf --border --preview "eval 'echo \$'{}" --preview-window=up,45%         "$@" ;;
#     # ssh)          fzf --preview 'dig {}'                   "$@" ;;
#     *)            fzf --height=85% --border --preview 'bat -n --color=always --style=numbers --line-range=:500 {}' --preview-window=up,45% "$@" ;;
#   esac
# }

# fzf keybindings and completion
source <(fzf --zsh)