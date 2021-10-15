#! /bin/sh

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# All apps (This line is 2 times because there are dependencies between brew cask and brew)
brew bundle --file="$DOTFILES_PATH/mac/brew/Brewfile"
brew bundle --file="$DOTFILES_PATH/mac/brew/Brewfile"

# Correct paths (so, we handle all with $PATH)
sudo truncate -s 0 /etc/paths
