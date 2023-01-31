#!/usr/bin/env bash

cd ~/Downloads

# Download the source code
curl -fsSL https://releases.llvm.org/5.0.0/llvm-5.0.0.src.tar.xz | tar -Jxvf -
mv llvm-5.0.0.src llvm
cd llvm/tools
curl -fsSL https://releases.llvm.org/5.0.0/cfe-5.0.0.src.tar.xz | tar -Jxvf -
mv cfe-5.0.0.src clang
cd clang/tools
curl -fsSL https://releases.llvm.org/5.0.0/clang-tools-extra-5.0.0.src.tar.xz | tar -Jxvf -
mv clang-tools-extra-5.0.0.src extra

# Create a separate directory for building
cd ../../../..
mkdir llvm-build
cd llvm-build

# Build and install
cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ../llvm
make
sudo make install

# Clean-up
cd ..
rm -r llvm llvm-build
