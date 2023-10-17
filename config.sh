#!/bin/bash

currDir=$(cd `dirname $0`; pwd)
homeDir=$HOME
machine=$(uname)

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
ln -sf $currDir/vim/coc-settings.json $homeDir/.vim/coc-settings.json

# bash

rm -rf $homeDir/.dircolors
ln -sv $currDir/bash/dircolors $homeDir/.dircolors

if [ "$machine" = "Darwin" ]; then
    rm -rf $homeDir/.bash_profile
    ln -sv $currDir/bash/bashrc $homeDir/.bash_profile
    source $homeDir/.bash_profile
else
    rm -rf $homeDir/.bashrc
    ln -sv $currDir/bash/bashrc $homeDir/.bashrc
    source $homeDir/.bashrc
fi

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

# i3
rm -rf $homeDir/.i3
ln -sv $currDir/i3 $homeDir/.i3

# ssh
mkdir -p $homeDir/.ssh
rm -rf $homeDir/.ssh/config
ln -sv $currDir/ssh/config $homeDir/.ssh/config

crontab -l > /tmp/crontab
if [ $(grep backup /tmp/crontab) ]; then
    echo "0 17 * * 5 sh $currDir/backup.sh > /dev/null 2>&1" >> /tmp/crontab
fi
crontab /tmp/crontab
rm -rf /tmp/crontab
