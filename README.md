My dotfiles [rice](https://www.urbandictionary.com/define.php?term=ricer), feel free to grab a piece.
This elegant approach to dotfiles management was inspired by the [idea](https://news.ycombinator.com/item?id=11071754) of user StreakyCobra.

This repository stores personalized configuration files for the following software.
- dunst
- i3-gaps
- mpd
- mpv
- neomutt
- neovim
- newsboat
- ncmpcpp
- ranger
- tmux
- X11
- zathura
- zsh

Full integration requires patching and building some tools made by [Suckless](https://suckless.org) of which the most important are st, dmenu, slock and tabbed.
Checkout my [suckless-builds](https://github.com/baj0k/suckless-builds) repository for the out-of-the-box solution.

In order to use firefox configuration files the ~/.config/ffox/chrome directory needs to be manually copied into chrome directory in the firefox profile.

# Installation
Following command installs the dotfiles into your workspace. Do not run this carelessly.
```
curl -L https://raw.githubusercontent.com/baj0k/dotfiles/desktop/setup.sh | sh
```
Or execute following commands manually if changes are needed.
```
git clone --separate-git-dir="$HOME/.local/dotfiles" https://github.com/baj0k/dotfiles.git /tmp/dotfiles
rsync -rv --exclude '.git' /tmp/dotfiles/ ~/
git --git-dir="$HOME/.local/dotfiles/" --work-tree="$HOME/" update-index --assume-unchanged "README.md" ".gitignore" "LICENSE" "setup.sh"
mv ~/.gitignore ~/.local/dotfiles/info/exclude
rm ~/README.md ~/LICENSE ~/setup.sh
```
In addition, it might be desired to create post-merge hook for automatic update & cleanup of .gitignore
```
cat <<EOF > ~/.local/dotfiles/hooks/post-merge
#!/bin/sh

echo "POST-MERGE"
[ -e "$HOME/.gitignore" ] && /usr/bin/mv ~/.gitignore ~/.local/dotfiles/info/exclude && echo "Updated .g
[ -e "$HOME/README.md" ] && /usr/bin/rm ~/README.md && echo "Removed README.md"
[ -e "$HOME/setup.sh" ] && /usr/bin/rm ~/setup.sh && echo "Removed setup.sh"
EOF

chmod +x ~/.local/dotfiles/hooks/post-merge
```
# Usage
Below commands might be useful for managing dotfiles using this approach. 
```
alias mdot='git --git-dir=$HOME/.local/dotfiles/ --work-tree=$HOME/'
mdot config status.showUntrackedFiles no
mdot remote set-url origin git@github.com:baj0k/dotfiles.git
```
