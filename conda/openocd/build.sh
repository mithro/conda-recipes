#!/bin/bash

./bootstrap
mkdir build
cd build
../configure \
  --prefix="$PREFIX" \
  --enable-ftdi
make -j$CPU_COUNT
make install

