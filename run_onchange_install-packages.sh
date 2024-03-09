#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
tap "homebrew/cask-fonts"

brew "awscli"
brew "bottom"
brew "chezmoi"
brew "eksctl"
brew "fzf"
brew "git"
brew "go"
brew "jq"
brew "kubectl"
brew "kubectx"
brew "lazygit"
brew "neovim"
brew "nodenv"
brew "podman"
brew "pyenv"
brew "ripgrep"
brew "starship"
brew "terraform"
brew "terraform-docs"
brew "tmux"
brew "tree"
brew "watch"
brew "wget"
brew "zoxide"
brew "zsh-completions"

cask "font-jetbrains-mono-nerd-font"
EOF
