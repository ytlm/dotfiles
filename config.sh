#!/bin/bash
dir=`pwd`
# conky
ln -s $dir/conky /etc/conky

# sublime text 3
ln -s $dir/sublimeText3 $HOME/.config/sublime-text-3

# tmux
ln -s $dir/tmux/tmux.conf $HOME/.tmux.conf

# vim
ln -s $dir/vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim /root/.vim

# bash
ln -s $dir/bash/bashrc $HOME/.bashrc

# zsh
ln -s $dir/zsh/zshrc $HOME/.zshrc

# gdb init
ln -s $dir/gdb $HOME/gdb

# aria2
ln -s $dir/aria2 /etc/aria2

# screenfetch
ln -s $dir/screenFetch/screenfetch-dev /bin/screenfetch
