#!/usr/bin/env bash

yum install perl-devel perl perl-ExtUtils-Embed

git clone https://github.com/vim/vim.git


pushd vim
    ./configure --prefix=/usr --enable-multibyte --with-features=huge --enable-cscope=yes --enable-perlinterp=yes --enable-rubyinterp=yes --enable-luainterp=yes --enable-pythoninterp=yes --with-python-config-dir=/usr/bin/python2-config --enable-tclinterp=yes --enable-gui=no CFLAGS="-I/usr/lib64/perl5/CORE"
    make
    sudo make install
popd

