# Tab-complete Zellij session names (with metadata descriptions).
# Source after compinit, e.g.:
#   source ~/workplace/lazyellij/completions/zellij-sessions.zsh

_zellij_lazy_sessions() {
  local -a sessions
  local line name desc
  while IFS= read -r line; do
    [[ -z $line ]] && continue
    name=${line%% *}
    desc=${${line#* }:-session}
    sessions+=("$name:$desc")
  done < <(zellij list-sessions --no-formatting 2>/dev/null)
  _describe -t sessions 'zellij session' sessions
}

_zellij_lazy() {
  local line state
  _arguments -C \
    '1: :->cmds' \
    '*::arg:->args' && return 0

  case $state in
    cmds)
      local -a cmds
      cmds=(
        'attach:attach to a session'
        'a:attach to a session'
        'kill-session:kill a session'
        'k:kill a session'
        'delete-session:delete a session'
        'd:delete a session'
        'watch:watch a session (read-only)'
        'w:watch a session (read-only)'
        'list-sessions:list sessions'
        'ls:list sessions'
      )
      _describe -t commands 'command' cmds
      ;;
    args)
      case ${words[1]} in
        attach|a|kill-session|k|delete-session|d|watch|w)
          _zellij_lazy_sessions
          ;;
        *)
          _default
          ;;
      esac
      ;;
  esac
}

compdef _zellij_lazy zellij
