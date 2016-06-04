#!/bin/bash

./bootstrap
mkdir build
cd build
../configure \
  --prefix="$PREFIX" \
  --enable-ftdi
make -j$CPU_COUNT
make install

./src/openocd --version 2>&1 | head -1 | sed -e's/-/_/g' -e's/.* 0\./0./' -e's/ .*//' > ../__conda_version__.txt
./src/openocd --version 2>&1 | head -1 | sed -e's/[^(]*(//' -e's/)//' -e's/://g' -e's/-/_/g' > ../__conda_buildstr__.txt
TZ=UTC date +%Y%m%d%H%M%S > ../__conda_buildnum__.txt
