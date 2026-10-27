# lazyellij

Fuzzy Zellij session picker with a preview pane — plus optional zsh Tab completion for session names.

```
lazyellij ›
> rusty-zebra
  scratch
  ┌─ preview ────────────────┐
  │ session  rusty-zebra     │
  │ Created 2d ago (current) │
  │ … layout dump …          │
  └──────────────────────────┘
```

## Requirements

- [Zellij](https://zellij.dev/)
- [fzf](https://github.com/junegunn/fzf)
- bash (picker) / zsh (optional completions)

## Install

```bash
git clone git@github.com:danielliew/lazyellij.git ~/workplace/lazyellij
chmod +x ~/workplace/lazyellij/bin/lzj
```

Add to `~/.zshrc`:

```zsh
export PATH="$HOME/workplace/lazyellij/bin:$PATH"

# Optional: Tab-complete `zellij attach <session>`
autoload -Uz compinit && compinit
source "$HOME/workplace/lazyellij/completions/zellij-sessions.zsh"

# Optional: lzj completion
fpath=("$HOME/workplace/lazyellij/completions" $fpath)
```

## Usage

```bash
lzj              # open picker
lzj work         # attach to "work" (create if missing)
lzj ls           # list session names
```

### Picker keys

| Key | Action |
|-----|--------|
| `enter` | attach (create if missing) |
| `ctrl-n` | create a new detached session, reload |
| `ctrl-d` | kill selected session |
| `ctrl-x` | delete selected session |
| `ctrl-r` | reload list |
| `esc` | cancel |

## License

MIT
