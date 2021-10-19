#MANUAL CHANGES
# NVM
export NVM_DIR="$HOME/.nvm"
 [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
 [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# thefuck
eval $(thefuck --alias)

# z smart cd
. $(brew --prefix)/etc/profile.d/z.sh

# syntax highlight for zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh