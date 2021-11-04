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

# open home in firefox if no arg otherwise open url
function ff {
	if [ $# -eq 0 ]; then
		open -a firefox -g $HOME
	else
		open -a firefox -g "$@"
	fi
}

# Print the tree with colour and hidden files
function tre {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

function killonport {
	lsof -ti tcp:$@ | xargs kill
}

# Attempt to open current branch in browser
# Copied from https://github.com/cagiti/setup/blob/main/.functions
function repo {
	# Figure out github repo base URL
	local base_url
	base_url=$(git config --get remote.origin.url)
	base_url=${base_url%\.git} # remove .git from end of string

	# Fix git@github.com: URLs
	base_url=${base_url//git@github\.com:/https:\/\/github\.com\/}

	# Fix git://github.com URLS
	base_url=${base_url//git:\/\/github\.com/https:\/\/github\.com\/}

	# Fix git@bitbucket.org: URLs
	base_url=${base_url//git@bitbucket.org:/https:\/\/bitbucket\.org\/}

	# Fix git@gitlab.com: URLs
	base_url=${base_url//git@gitlab\.com:/https:\/\/gitlab\.com\/}

	# Validate that this folder is a git folder
	if ! git branch 2>/dev/null 1>&2; then
		echo "Not a git repo!"
		exit $?
	fi

	# Find current directory relative to .git parent
	full_path=$(pwd)
	git_base_path=$(
		cd "./$(git rev-parse --show-cdup)" || exit 1
		pwd
	)
	relative_path=${full_path#$git_base_path} # remove leading git_base_path from working directory

	# If filename argument is present, append it
	if [ "$1" ]; then
		relative_path="$relative_path/$1"
	fi

	# Figure out current git branch
	# git_where=$(command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
	git_where=$(command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null

	# Remove cruft from branchname
	branch=${git_where#refs\/heads\/}
	branch=${branch#remotes\/origin\/}

	[[ $base_url == *bitbucket* ]] && tree="src" || tree="tree"
	url="$base_url/$tree/$branch$relative_path"

	echo "Calling $(type open) for $url"

	open "$url" &>/dev/null || (echo "Using $(type open) to open URL failed." && exit 1)
}

function search {
	old="$IFS"
	IFS='+'
	query="$*"
	IFS=$old
	url="https://www.google.com/search?q=$query"
	open "$url"
}

alias reload="source ~/.zshrc"

# List files in current dir that dont have exec permissions
alias lnx="echo *(f:u+rx,o-x:)"

# Browse home dir in browser
alias bh="open -a firefox -g $HOME"

# Get public IP
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"

# copy file interactive
alias cp='cp -i'

# move file interactive
alias mv='mv -i'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

##### suffix aliases

alias -s {js, jsx, ts, tsx, md, json}='code'
alias -s {com}='open -a firefox -g'
