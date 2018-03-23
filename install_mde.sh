#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/md11235/utility-config/master/.tmux.conf -o ~/.tmux.conf
curl -fsSL https://raw.githubusercontent.com/md11235/utility-config/master/.zshrc -o ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/md11235/utility-config/master/.vimrc -o ~/.vimrc
curl -fsSL https://raw.githubusercontent.com/md11235/utility-config/master/.gitconfig -o ~/.gitconfig

chsh -s $(which zsh)

