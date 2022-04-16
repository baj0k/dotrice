#!/bin/sh

# Clone repository
/usr/bin/git clone --separate-git-dir="$HOME/.local/dotfiles" https://github.com/baj0k/dotfiles.git /tmp/dotfiles

# Deploy dotfiles
/usr/bin/rsync -r --exclude '.git' /tmp/dotfiles/ ~/

# Do not track maintenance files
/usr/bin/git --git-dir="$HOME/.local/dotfiles/" --work-tree="$HOME/" update-index --assume-unchanged "README.md" ".gitignore" "LICENSE" "setup.sh"

# Cleanup home
/usr/bin/mv ~/.gitignore ~/.local/dotfiles/info/exclude
/usr/bin/rm ~/README.md ~/LICENSE ~/setup.sh

# Create post-merge hook for automatic gitignore update & cleanup
cat <<EOF > ~/.local/dotfiles/hooks/post-merge
#!/bin/sh

echo "POST-MERGE"
[ -e "$HOME/.gitignore" ] && /usr/bin/mv ~/.gitignore ~/.local/dotfiles/info/exclude && echo "Updated .gitignore"
[ -e "$HOME/README.md" ] && /usr/bin/rm ~/README.md && echo "Removed README.md"
[ -e "$HOME/setup.sh" ] && /usr/bin/rm ~/setup.sh && echo "Removed setup.sh"
EOF

/usr/bin/chmod +x ~/.local/dotfiles/hooks/post-merge
