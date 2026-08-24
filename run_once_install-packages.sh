#!/bin/bash
# chezmoi run_once script: installs the software this dotfiles repo's config expects.
# Runs automatically ONCE per machine on `chezmoi apply` (re-runs only if this
# file's contents change). Safe to re-run: every step checks before installing.

set -eu

[ "$(uname)" = "Darwin" ] || exit 0

echo "==> Bootstrapping packages for dotfiles..."

# --- Homebrew ---------------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ -x /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  fi
fi

# --- Packages from Brewfile -------------------------------------------------
if [ -f "$HOME/.Brewfile" ]; then
  brew bundle --file="$HOME/.Brewfile"
else
  echo "WARNING: ~/.Brewfile not found; skipping package install" >&2
fi

# --- Oh My Zsh --------------------------------------------------------------
# KEEP_ZSHRC=yes stops the installer from replacing the chezmoi-managed .zshrc.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- SDKMAN -----------------------------------------------------------------
# rcupdate=false stops the installer from appending init lines to .zshrc.
if [ ! -d "$HOME/.sdkman" ]; then
  echo "==> Installing SDKMAN..."
  curl -s "https://get.sdkman.io?rcupdate=false" | bash
fi

# --- nvm --------------------------------------------------------------------
# PROFILE=/dev/null stops the installer from appending init lines to .zshrc.
if [ ! -d "$HOME/.nvm" ]; then
  echo "==> Installing nvm..."
  PROFILE=/dev/null bash -c \
    "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh)"
fi

# Note: sketchybar and borders are NOT started here — aerospace launches both
# via after-startup-command in aerospace.toml.

echo "==> Done. Open a new terminal (or 'exec zsh') to pick everything up."
