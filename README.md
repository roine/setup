# Export

```bash
./export.sh
```

This will update the Brewfile.

# Install

```bash
./install.sh
```

This will:

-   Symlink all the dotfiles to their respective locations. (git, zsh)
-   Change the shell to use ZSH
-   Install Homebrew
-   Install binaries using the Brewfile
-   Install oh my zsh
-   Install p10k

Optionally you can run with --only or --skip flags.

```bash
./install --only git
# only installs git
./install --skip git,zsh
# install all but git and zsh
```

# Manual

Some things need to be imported manually:

-   iTerm profile and config
-   Fonts for p10k

# TODO

-   [ ] Auto export Dotfiles
-   [ ] Auto export editors config
-   [ ] Auto export/import iTerm profile and config
-   [ ] Show valid values for skip and ignore if nothing passed
-   [ ] Have a file to keep a state (remember what was already installed)

# Complete

-   [x] Export vimrc
-   [x] Export zshrc
-   [x] Support selective install
-   [x] Check if file exists
