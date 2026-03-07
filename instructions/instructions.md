# Installation instructions

After installing Arch Linux, install git to clone the repo, then use `sudo pacman -S - < packages.txt` to install all the packages I would use.

Install [Oh My Zsh](https://ohmyz.sh/) here, select no for override, yes for default shell.

Then run `chsh -s $(which zsh)` to change your shell to zsh by default.

Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) into `~/.local/share/font/$fontname` then run `fc-cache -f -v`. Use `fc-list : family | grep "Nerd Font"` to find the family name. This is used in your terminal emulator font configuration.

cd into the dotfiles/ directory and run `stow *` to add all my configs.
