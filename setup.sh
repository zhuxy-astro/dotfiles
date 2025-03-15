#!/bin/zsh

dotpath='/Users/zhuxy/Projects/computer/dotfiles'

ln -nfs $dotpath/ssh_config ~/.ssh/config
ln -nfs $dotpath/gitconfig ~/.gitconfig
ln -nfs $dotpath/gitignore ~/.gitignore
ln -nfs $dotpath/zshrc ~/.zshrc
ln -nfs $dotpath/zshenv ~/.zshenv
ln -nfs $dotpath/crontab_pro ~/.crontab_pro
ln -nfs $dotpath/vimrc ~/.vimrc
ln -nfs $dotpath/tmux.conf ~/.tmux.conf
ln -nfs $dotpath/bashrc ~/.bashrc
ln -nfs $dotpath/bash_profile ~/.bash_profile
ln -nfs $dotpath/ipython_config.py ~/.ipython/profile_default/ipython_config.py
ln -nfs $dotpath/ipython_kernel_config.py ~/.ipython/profile_default/ipython_kernel_config.py
ln -nfs $dotpath/UltiSnips ~/.vim/UltiSnips
ln -nfs $dotpath/vim_syntax ~/.vim/after/syntax
ln -nfs $dotpath/sioyek/keys_user.config /Users/zhuxy/Library/Application\ Support/sioyek/keys_user.config.sync
ln -nfs $dotpath/sioyek/prefs_user.config /Users/zhuxy/Library/Application\ Support/sioyek/prefs_user.config 
