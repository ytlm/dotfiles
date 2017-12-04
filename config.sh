#!/bin/bash

currDir=`pwd`
homeDir="/home/ytl"
rootDir="/root"

if [ "$USER" = "root" ];then

# conky
    rm -rf /etc/conky
    ln -s $currDir/conky /etc/conky

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

#bashrc
    rm -rf $rootDir/.bashrc
    ln -s $currDir/bash/bashrc $rootDir/.bashrc

#sublime text 3
    mkdir -p $rootDir/.config
    rm -rf $rootDir/.config/sublime-text-3
    ln -s $currDir/sublimeText3 $rootDir/.config/sublime-text-3

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
ln -sv $currDir/vim/ycm_extra_conf.py $homeDir/.vim/ycm_extra_conf.py

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

# fonts, Source Code Pro
rm -rf $homeDir/.fonts
sudo ln -sv $currDir/fonts/ $homeDir/.fonts
fc-cache -f -v
