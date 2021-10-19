#!/bin/zsh

# Oh my zsh
if [[ "$ZSH" != *"oh-my-zsh"* ]]; then
    echo "Installing oh my zsh 👇"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# p10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing p10k 👇"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
fi

echo "Copying zsh dotfiles 👇"

# Copy configs
ln -s -i "$DOTFILES_PATH/zsh/.zshrc" "$HOME/.zshrc"
ln -s -i "$DOTFILES_PATH/zsh/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
ln -s -i "$DOTFILES_PATH/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

# Change default terminal to ZSH
chsh -s "$(command -v zsh)"