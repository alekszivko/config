# config

Personal dotfiles for macOS, managed with [chezmoi](https://chezmoi.io).
Shell, terminal, window manager, status bar, tmux, and the bootstrap that
installs all of it.

## What's inside

| Path | Becomes | What it is |
|---|---|---|
| `dot_zshrc` | `~/.zshrc` | zsh + Oh My Zsh config, plugins, eza aliases |
| `dot_zprofile` | `~/.zprofile` | login-shell env (Homebrew `shellenv`, PATH) |
| `dot_tmux.conf` | `~/.tmux.conf` | tmux with tpm, Catppuccin theme, tmux-fzf |
| `dot_config/tmuxinator/` | `~/.config/tmuxinator/` | tmuxinator project layouts (`tmuxinator start <name>`) |
| `dot_Brewfile` | `~/.Brewfile` | Homebrew package manifest (`brew bundle`) |
| `dot_config/kitty/` | `~/.config/kitty/` | kitty terminal (Dracula) |
| `dot_config/aerospace/` | `~/.config/aerospace/` | AeroSpace tiling WM (launches sketchybar + borders) |
| `dot_config/sketchybar/` | `~/.config/sketchybar/` | status bar + plugins |
| `.chezmoiexternal.toml` | — | zsh-autosuggestions & zsh-syntax-highlighting, auto-downloaded weekly |
| `run_once_install-packages.sh` | — | machine bootstrap, runs once on `chezmoi apply` |
| `keyboard/` | — | Keychron keymap exports (storage only, never applied) |

## New machine

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:alekszivko/config.git
```

Or with chezmoi already installed:

```sh
chezmoi init --apply git@github.com:alekszivko/config.git
```

This applies every config file and runs the bootstrap script, which installs
(only what's missing): Homebrew itself, everything in `~/.Brewfile`,
Oh My Zsh, SDKMAN, and nvm — without letting any installer touch the
managed `.zshrc`.

Manual follow-ups (once):

- Homebrew's installer asks for the sudo password.
- In tmux: `Ctrl-b` `Shift-I` to install tpm plugins (theme included).
- Quit and reopen kitty / reload aerospace so fonts and icons load.

## Without chezmoi

Everything here is a plain file — no templates. On a machine where chezmoi
can't be installed, copy files by hand: `dot_` maps to a leading dot
(`dot_zshrc` → `~/.zshrc`, `dot_config/kitty/` → `~/.config/kitty/`).

```sh
curl -o ~/.zshrc https://raw.githubusercontent.com/alekszivko/config/main/dot_zshrc
brew bundle --file=<(curl -fsSL https://raw.githubusercontent.com/alekszivko/config/main/dot_Brewfile)
```

## Daily use

```sh
chezmoi edit ~/.zshrc     # edit the source copy…
chezmoi diff              # …preview…
chezmoi apply             # …apply
chezmoi re-add            # sync back files edited directly
chezmoi update            # pull this repo + apply (other machines)
chezmoi cd                # enter this repo to commit & push
```

Rule of thumb: `diff` before `apply`, `re-add` after direct edits,
push what's worth keeping.

## Machine-specific packages

`dot_Brewfile` installs only what belongs on every machine. Extras
(SDR tools, ghidra, k8s, lima, …) are listed as comments at the bottom —
install those by hand where they belong. `brew bundle` never uninstalls
anything.
