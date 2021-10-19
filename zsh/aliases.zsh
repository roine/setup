# Create a path of dir and go into it
# mkcd -p a/b/c/d & pwd => a/b/c/d
function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}

alias reload="source ~/.zshrc"

# List files in current dir that dont have exec permissions
alias lnx="echo *(f:u+rx,o-x:)"
alias ff="open -a firefox -g"
# Browse home dir in browser
alias bh="open -a firefox -g $HOME"

##### suffix aliases

alias -s {js, jsx, ts, tsx, md, json}='code'
alias -s {com}='open -a firefox -g'

