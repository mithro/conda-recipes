#!/bin/bash

./bootstrap
./configure --prefix="$PREFIX" \
    --enable-ftdi
make -j$CPU_COUNT
make install

