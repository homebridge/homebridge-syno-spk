#!/bin/bash

set -x
set -e

# move build files into source dir
mkdir -p /toolkit/source
cp -R $GITHUB_WORKSPACE /toolkit/source/homebridge-syno-spk

# build spk
/toolkit/pkgscripts-ng/PkgCreate.py -p braswell -c homebridge-syno-spk
