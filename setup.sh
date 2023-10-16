#!/bin/zsh

dotpath='/Users/zhuxy/Projects/computer/dotfiles'

ln -nfs $dotpath/gitconfig ~/.gitconfig
ln -nfs $dotpath/gitignore ~/.gitignore
ln -nfs $dotpath/zshrc ~/.zshrc
ln -nfs $dotpath/zshenv ~/.zshenv
ln -nfs $dotpath/crontab ~/.crontab
ln -nfs $dotpath/vimrc ~/.vimrc
ln -nfs $dotpath/tmux.conf ~/.tmux.conf
ln -nfs $dotpath/bashrc ~/.bashrc
ln -nfs $dotpath/bash_profile ~/.bash_profile
ln -nfs $dotpath/ipython_config.py ~/.ipython/profile_default/ipython_config.py
ln -nfs $dotpath/ipython_kernel_config.py ~/.ipython/profile_default/ipython_kernel_config.py
ln -nfs $dotpath/UltiSnips ~/.vim/UltiSnips
