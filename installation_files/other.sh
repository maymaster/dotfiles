#!/usr/bin/env bash

# Author:
# 		Sergio Quijano Rey
# 		sergiquijano@gmail.com
# Description:
# 		Makes installation stuff that don't fit in other scripts
# Version:
# 		v1.0 - 18/04/2019: First documented version

# Install vim plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install neovim dependencies
sudo pip3 install --upgrade --user pynvim
sudo pip install --upgrade --user pynvim
sudo pip3 install pynvim
sudo pip install pynvim

# .profile is a symlink to .bash_profile
# Some programs like rofi source .profile instead of .bash_profile. Also i3wm
# itself sources only .profile
rm $HOME/.profile
ln -s $HOME/.bash_profile $HOME/.profile
