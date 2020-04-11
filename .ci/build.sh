#!/bin/bash

set -x

cd /toolkit

# move build files into source dir
mkdir -p /toolkit/source
cp -R $GITHUB_WORKSPACE /toolkit/source/homebridge-syno-spk

# build spk
./pkgscripts-ng/PkgCreate.py -c homebridge-syno-spk
