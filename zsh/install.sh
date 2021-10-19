#!/bin/zsh

# Oh my zsh
if [[ "$ZSH" != *"oh-my-zsh"* ]]; then
    echo "Installing oh my zsh 👇"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    chmod +x ~/.oh-my-zsh/tools/upgrade.sh
    sh -c "~/.oh-my-zsh/tools/upgrade.sh"
fi

# p10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing p10k 👇"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
fi

echo "Copying zsh dotfiles 👇"

# Copy configs
mv $HOME/.zshrc $HOME/.zshrc.old
ln -s -i "$DOTFILES_PATH/zsh/.zshrc" "$HOME/.zshrc"
mv $HOME/.oh-my-zsh/custom/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh.old
ln -s -i "$DOTFILES_PATH/zsh/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
mv $HOME/.zsh/.p10k.zsh $HOME/.zsh/.p10k.zsh.old
ln -s -i "$DOTFILES_PATH/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

# Change default terminal to ZSH
chsh -s "$(command -v zsh)"