# Installation instructions

## Prerequisites (SSH)

Make sure that ssh and git is installed, then run the following:
```bash 
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
#Copy this output to clipboard and paste it into your GitHub Keys
```

After installing Arch Linux, install git to clone the repo, then use `sudo pacman -S - < packages.txt` to install all the packages I would use.

Install [Oh My Zsh](https://ohmyz.sh/) here, select no for override, yes for default shell.

Then run `chsh -s $(which zsh)` to change your shell to zsh by default.

Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) into `~/.local/share/font/$fontname` then run `fc-cache -f -v`. Use `fc-list : family | grep "Nerd Font"` to find the family name. This is used in your terminal emulator font configuration.

cd into the dotfiles/ directory and run `stow *` to add all my configs.
