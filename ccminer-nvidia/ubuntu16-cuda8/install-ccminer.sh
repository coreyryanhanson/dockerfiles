#! /bin/bash

cd /ccminer
./autogen.sh
./configure
./build.sh
make install
cd ..
/bin/bash
