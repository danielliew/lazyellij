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
# Required for the picker
export PATH="$HOME/workplace/lazyellij/bin:$PATH"

# Optional: Tab-complete session names on `zellij a` / attach / kill / delete / watch
# (names + metadata only — no fzf preview; that is lzj only)
autoload -Uz compinit && compinit
source "$HOME/workplace/lazyellij/completions/zellij-sessions.zsh"

# Optional: Tab-complete `lzj` itself
fpath=("$HOME/workplace/lazyellij/completions" $fpath)
```

## Usage

### Picker (`lzj`) — fuzzy list + preview

```bash
lzj              # open fzf picker with preview pane
lzj work         # attach to "work" (create if missing)
lzj ls           # list session names
```

`zellij a` / `zellij attach` are unchanged: they do **not** open this picker. Use `lzj` for preview.

### Tab completion (`zellij a`) — optional

With the completer sourced above, Tab on session args works:

```bash
zellij a <Tab>           # lists sessions (name + created/current metadata)
zellij attach <Tab>
zellij kill-session <Tab>
```

This only completes names in the shell. It does not show the fzf preview pane.

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
