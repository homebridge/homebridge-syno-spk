#!/bin/bash

set -x
set -e

function ver { printf "%03d%03d%03d%03d" $(echo "$1" | tr '.' ' '); }

# move build files into source dir
mkdir -p /toolkit/source
cp -R $GITHUB_WORKSPACE /toolkit/source/homebridge-syno-spk

# grap the node.js binary
cd /toolkit/source/homebridge-syno-spk

# get meta about most recent LTS
NODE_OFFICIAL_LTS="$(curl -s https://nodejs.org/dist/index.json | jq -r 'map(select(.lts))[0].version')"
NODE_LTS="$(echo ${NODE_OFFICIAL_LTS} | jq -r \"select([.files[] == \\\"linux-${NODE_ARCH}\\\"] | any).version\")"
# check if arch officially supported
if [ ! -z $NODE_LTS ];
then
   wget https://nodejs.org/dist/${NODE_LTS}/node-${NODE_LTS}-linux-${NODE_ARCH}.tar.gz -O node-linux-${NODE_ARCH}.tar.gz
else
   # if not then fetch arch from unofficial release
   NODE_LTS=$(curl -s https://unofficial-builds.nodejs.org/download/release/index.json | jq -r "map(select(.lts and ([.files[] == \"linux-${NODE_ARCH}\"] | any)))[0].version")
   wget https://unofficial-builds.nodejs.org/download/release/${$NODE_LTS}/node-${$NODE_LTS}-linux-${NODE_ARCH}.tar.gz -O node-linux-${NODE_ARCH}.tar.gz
fi

# build spk
/toolkit/pkgscripts-ng/PkgCreate.py -p $SPK_PLATFORM -c homebridge-syno-spk

# copy spk to github workspace
cp /toolkit/build_env/ds.$SPK_PLATFORM-7.0/image/packages/homebridge-$SPK_PLATFORM-$SPK_PACKAGE_VERSION.spk $GITHUB_WORKSPACE/
