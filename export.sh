#! /usr/bin/env sh

CURRENT_FILE_PATH="$(pwd)/$(dirname $0)"
export DOTFILES_PATH=${CURRENT_FILE_PATH%"/."}

echo "👉 dotfiles path: '$DOTFILES_PATH'"
echo ""
echo "👇 Export dotfiles 👇"
echo ""
cp ~/.zshrc $DOTFILES_PATH/zsh/.zshrc
cp ~/.p10k.zsh $DOTFILES_PATH/zsh/.p10k.zsh
cp ~/.oh-my-zsh/custom/aliases.zsh $DOTFILES_PATH/zsh/aliases.zsh
cp ~/.gitconfig $DOTFILES_PATH/git/.gitconfig
cp ~/.gitignore_global $DOTFILES_PATH/git/.gitignore_global
cp ~/.vimrc $DOTFILES_PATH/.vimrc
echo "👇 Export Brewfile 👇"
echo ""
brew bundle dump --file=./mac/brew/Brewfile --force

git status