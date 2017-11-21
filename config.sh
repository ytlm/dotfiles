#!/bin/bash

currDir=`pwd`
homeDir="/home/ytl"
rootDir="/root"

if [ "$USER" = "root" ];then

# conky
    rm -rf /etc/conky
    ln -s $currDir/conky /etc/conky

# bashrc
    rm -rf $rootDir/.bashrc
    ln -s $currDir/bash/bashrc $rootDir/.bashrc

#vim
    rm -rf $rootDir/.vim
    ln -s $homeDir/.vim $rootDir/.vim
    ln -s $currDir/vim/vimrc $rootDir/.vimrc

# aria2
    rm -rf /etc/aria2
    ln -s $currDir/aria2 /etc/aria2

# screenfetch
    rm -rf /bin/screenfetch
    ln -s $currDir/screenFetch/screenfetch-dev /bin/screenfetch

    exit 0

fi

# sublime text 3
mkdir -p $homeDir/.config
rm -rf $homeDir/.config/sublime-text-3
ln -s $currDir/sublimeText3 $homeDir/.config/sublime-text-3

# tmux
rm -rf $homeDir/.tmux.conf
ln -s $currDir/tmux/tmux.conf $homeDir/.tmux.conf

# vim
mkdir -p $homeDir/.vim/autoload
rm -rf $homeDir/.vimrc
ln -s $currDir/vim/vimrc $homeDir/.vimrc

# bash
rm -rf $homeDir/.bashrc
ln -s $currDir/bash/bashrc $homeDir/.bashrc

# zsh
rm -rf $homeDir/.zshrc
ln -s $currDir/zsh/zshrc $homeDir/.zshrc

# gdb init
rm -rf $homeDir/gdb
ln -s $currDir/gdb $homeDir/gdb

# gnome-shell extensions
mkdir -p $homeDir/.local/share/gnome-shell/
sudo ln -s $currDir/gnome-shell/extensions/ $homeDir/.local/share/gnome-shell/extensions
