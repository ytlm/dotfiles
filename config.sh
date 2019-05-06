#!/bin/bash

currDir=$(cd `dirname $0`; pwd)
homeDir="/home/${USER}/"
rootDir="/root/"

if [[ "$USER" = "root" ]];then

# aria2
    rm -rf /etc/aria2
    ln -sv $currDir/aria2 /etc/aria2

# vim
    rm -rf $rootDir/.vim
    ln -sv $homeDir/.vim $rootDir/.vim

fi

# conky
ln -sv $currDir/conky $homeDir/.config/conky

# sublime text 3
mkdir -p $homeDir/.config
rm -rf $homeDir/.config/sublime-text-3
ln -sv $currDir/sublimeText3 $homeDir/.config/sublime-text-3

# tmux
rm -rf $homeDir/.tmux.conf
ln -sv $currDir/tmux/tmux.conf $homeDir/.tmux.conf

# vim
mkdir -p $homeDir/.vim/autoload
rm -rf $homeDir/.vimrc
ln -sv $currDir/vim/vimrc $homeDir/.vimrc
ln -sv $currDir/vim/ycm_extra_conf.py $homeDir/.vim/ycm_extra_conf.py

# bash
rm -rf $homeDir/.bashrc
ln -sv $currDir/bash/bashrc $homeDir/.bashrc
source $homeDir/.bashrc

# zsh
rm -rf $homeDir/.zshrc
ln -sv $currDir/zsh/zshrc $homeDir/.zshrc

# gdb init
rm -rf $homeDir/gdb
ln -sv $currDir/gdb $homeDir/gdb

# gnome-shell extensions
mkdir -p $homeDir/.local/share/gnome-shell/
ln -sv $currDir/gnome/extensions/ $homeDir/.local/share/gnome/extensions
ln -sv $currDir/gnome/icons/ $homeDir/.icons

# git
rm -rf $homeDir/.gitconfig
ln -sv $currDir/git/gitconfig $homeDir/.gitconfig

crontab -l > /tmp/crontab
echo "0 17 * * 5 sh $currDir/backup.sh > /dev/null 2>&1" >> /tmp/crontab
crontab /tmp/crontab
rm -rf /tmp/crontab
