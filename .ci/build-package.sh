#!/bin/bash

set -x
set -e

# move build files into source dir
mkdir -p /toolkit/source
cp -R $GITHUB_WORKSPACE /toolkit/source/homebridge-syno-spk

# grap the node.js binary
cd /toolkit/source/homebridge-syno-spk

NODE_LTS="$(curl -s https://nodejs.org/dist/index.json | jq -r 'map(select(.lts))[0].version')"
wget https://nodejs.org/dist/$NODE_LTS/node-$NODE_LTS-linux-${NODE_ARCH}.tar.gz -O node-linux.tar.gz

# build spk
/toolkit/pkgscripts-ng/PkgCreate.py -p $SPK_PLATFORM -c homebridge-syno-spk

# copy spk to github workspace
cp /toolkit/build_env/ds.$SPK_PLATFORM-7.0/image/packages/homebridge-$SPK_PLATFORM-$SPK_PACKAGE_VERSION.spk $GITHUB_WORKSPACE/
