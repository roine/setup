# z smart cd
. $(brew --prefix)/etc/profile.d/z.sh

export ZSH="/Users/jon/.oh-my-zsh"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=/usr/local/bin:$PATH

plugins=(git)

source $ZSH/oh-my-zsh.sh


#MANUAL CHANGES
# NVM
export NVM_DIR="$HOME/.nvm"
 [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
 [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# thefuck
eval $(thefuck --alias)



# syntax highlight for zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

