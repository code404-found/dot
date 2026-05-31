#!/usr/bin/env zsh

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# homebrew packages
brew update
brew install git neovim tmux irssi fnm wget jq ripgrep fd fzf
brew install --cask keepassxc ghostty

# link configs
mkdir -p ~/.config/nvim && ln -sf ~/dot/nvim/init.lua ~/.config/nvim
mkdir -p ~/.config/tmux && ln -sf ~/dot/tmux/tmux.conf ~/.config/tmux
mkdir -p ~/.config/ghostty && ln -sf ~/dot/ghostty/config ~/.config/ghostty
ln -sf ~/dot/zsh/.zshrc ~/

# setup fnm & nodejs
eval "$(fnm env --use-on-cd --shell zsh)"
fnm use lts-latest --install-if-missing
fnm default lts-latest

# npm packages
npm i -g npm@latest
npm i -g typescript typescript-language-server vscode-langservers-extracted

# git
git config --global user.name "fb"
git config --global user.email "188580035+code404-found@users.noreply.github.com"
ssh-keygen -t ed25519 -C "188580035+code404-found@users.noreply.github.com" -f ~/.ssh/id_ed25519
