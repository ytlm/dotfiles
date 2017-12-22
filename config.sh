#!/bin/bash

currDir=$(cd `dirname $0`; pwd)
homeDir=$HOME

if [[ "$USER" = "root" ]];then

# conky
    rm -rf /etc/conky
    ln -sv $currDir/conky /etc/conky

# aria2
    rm -rf /etc/aria2
    ln -sv $currDir/aria2 /etc/aria2

# screenfetch
    rm -rf /bin/screenfetch
    ln -sv $currDir/screenFetch/screenfetch-dev /bin/screenfetch

# vim
    rm -rf $homeDir/.vim
    ln -sv $homeDir/.vim /root/.vim

fi

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
ln -sv $currDir/gnome-shell/extensions/ $homeDir/.local/share/gnome-shell/extensions

# fonts, Source Code Pro
rm -rf $homeDir/.fonts
ln -sv $currDir/fonts/ $homeDir/.fonts
fc-cache -f -v
