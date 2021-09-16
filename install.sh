#! /usr/bin/env sh

CURRENT_FILE_PATH="$(pwd)/$(dirname $0)"
export DOTFILES_PATH=${CURRENT_FILE_PATH%"/."}

echo "👉 dotfiles path: '$DOTFILES_PATH'"

OPERATIVE_SYSTEM="MacOS "
CUSTOM_INSTALLER="$DOTFILES_PATH/mac/install.sh"

echo "👉 OS: $OPERATIVE_SYSTEM"
echo ""
echo "👇 Installing $OPERATIVE_SYSTEM custom packages 👇"
echo ""

sh "$CUSTOM_INSTALLER"

echo "👇 Adding dotfiles 👇"
echo ""

ln -s -i "$DOTFILES_PATH/git/.gitconfig" "$HOME/.gitconfig"
ln -s -i "$DOTFILES_PATH/git/.gitignore_global" "$HOME/.gitignore_global"


# Change default terminal to ZSH
chsh -s "$(command -v zsh)"

