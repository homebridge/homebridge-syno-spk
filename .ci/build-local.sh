#!/bin/sh

export NODE_ARCH=arm64
export SPK_PLATFORM=armada37xx
export SPK_ARCH=armada37xx
export SPK_PACKAGE_VERSION="3.0.0"

# get node
if [ ! -f "node-linux-${NODE_ARCH}.tar.gz" ]; then
  NODE_LTS="$(curl -s https://nodejs.org/dist/index.json | jq -r 'map(select(.lts))[0].version')"
  wget https://nodejs.org/dist/$NODE_LTS/node-$NODE_LTS-linux-${NODE_ARCH}.tar.gz -O node-linux-${NODE_ARCH}.tar.gz
fi

# build spk
/toolkit/pkgscripts-ng/PkgCreate.py -p $SPK_PLATFORM -c homebridge-syno-spk