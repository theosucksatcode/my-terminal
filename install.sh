#!/usr/bin/env bash
# tells os to run this file with bash

set -euo pipefail # safety nets that stop everything immediately if 1 thing fails

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # figures out the absolute path of the folder the script lives in no matter where you run it from

echo "==> Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Install it first: https://brew.sh"
  exit 1
fi

echo "==> Installing packages via Homebrew..."
brew install starship zsh-autosuggestions zsh-syntax-highlighting
brew install --cask font-hack-nerd-font

echo "==> Backing up any existing config + customisation files..."
timestamp=$(date +%s)
[ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$timestamp"
[ -f "$HOME/.config/starship.toml" ] && [ ! -L "$HOME/.config/starship.toml" ] && mv "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.backup.$timestamp"

echo "==> Symlinking config + customisation files into place..."
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

echo ""
echo "Terminal setup complete 🚀"
echo ""
echo "One manual step left: Open Terminal > Settings > Profiles and set the font to 'Hack Nerd Font (needed for Starship's icons to render) for your desired profile and restart your terminal."