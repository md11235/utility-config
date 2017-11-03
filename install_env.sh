#!/bin/bash

#cd ~/
#wget https://raw.githubusercontent.com/md11235/utility-config/master/.zshrc
#wget https://raw.githubusercontent.com/md11235/utility-config/master/.tmux.conf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "$(curl -fsSL https://raw.githubusercontent.com/md11235/utility-config/master/.tmux.conf)" > .tmux.conf
