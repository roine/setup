#!/bin/zsh

CURRENT_FILE_PATH="$(pwd)/$(dirname $0)"
export DOTFILES_PATH=${CURRENT_FILE_PATH%"/."}

# get the machine running mac/win/linux
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac


echo "$OPTARG"
while test $# -gt 0; do
   case "$1" in
    --only)
        zsh_on=false
        vim_on=false
        git_on=false
        mac_on=false
        if [[ $2 == *"zsh"* ]] ;then
            zsh_on=true
        fi
        if [[ $2 == *"vim"* ]]; then
            vim_on=true
        fi
        if [[ $2 == *"git"* ]] ;then
            git_on=true
        fi
        if [[ $2 == *"mac"* ]] ;then
            mac_on=true
        fi
      shift
      ;;
    --skip)
        zsh_on=true
        vim_on=true
        git_on=true
        mac_on=true
        if [[ $2 == *"zsh"* ]] ;then
            zsh_on=false
        fi
        if [[ $2 == *"vim"* ]]; then
            vim_on=false
        fi
        if [[ $2 == *"git"* ]] ;then
            git_on=false
        fi
        if [[ $2 == *"mac"* ]] ;then
            mac_on=false
        fi
        shift
        ;;
    *)
      break
      ;;
   esac
done


export GIT_ENABLED=${git_on:=true}
export VIMRC_ENABLED=${vim_on:=true}
export ZSHRC_ENABLED=${zsh_on:=true}


if [[ "$machine" == "Mac" ]]; then
    export MAC_ENABLED=${mac_on:=true}
else
    export MAC_ENABLED=false
fi

echo "👉 dotfiles path: '$DOTFILES_PATH'"

if [[ "$MAC_ENABLED" == true ]]; then
    OPERATIVE_SYSTEM="MacOS "
    MAC_INSTALLER="$DOTFILES_PATH/mac/install.sh"
    echo ${(l:$COLUMNS::-:)}
    echo "👉 OS: $OPERATIVE_SYSTEM"
    echo ""
    echo "👇 Installing $OPERATIVE_SYSTEM custom packages 👇"
    echo ""

    sh "$MAC_INSTALLER"
fi

if [[ "$GIT_ENABLED" == true ]]; then
    echo ${(l:$COLUMNS::-:)}
    echo "👇 Enhancing GIT 👇"  
    echo ""
    ln -s -i "$DOTFILES_PATH/git/.gitconfig" "$HOME/.gitconfig"
    ln -s -i "$DOTFILES_PATH/git/.gitignore_global" "$HOME/.gitignore_global"
fi

if [[ "$ZSHRC_ENABLED" == true ]]; then
    if command -v zsh &> /dev/null
    then
        echo ${(l:$COLUMNS::-:)}
        echo "👇 Enhancing zsh 👇"
        echo ""

        sh $DOTFILES_PATH/zsh/install.sh
    else
        echo "zsh is not installed"
    fi

fi

if [[ "$VIMRC_ENABLED" == true ]]; then
    echo ${(l:$COLUMNS::-:)}
    echo "👇 Enhancing VIM 👇"  
    echo ""
    ln -s -i "$DOTFILES_PATH/.vimrc" "$HOME/.vimrc"
fi



