#! /usr/bin/env sh

CURRENT_FILE_PATH="$(pwd)/$(dirname $0)"
export DOTFILES_PATH=${CURRENT_FILE_PATH%"/."}

echo "👉 dotfiles path: '$DOTFILES_PATH'"
echo ""
echo "👇 Export Brewfile 👇"
echo ""
brew bundle dump --file=./mac/brew/Brewfile --force

git status