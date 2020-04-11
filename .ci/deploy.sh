#!/bin/bash

set -x
set -e

PKG_VERSION=$(cat $GITHUB_WORKSPACE/INFO.sh | grep version | awk -F '"' '{ print $2 }')

mkdir $GITHUB_WORKSPACE/github-release

cp /toolkit/result_spk/HomebridgeDocker-${PKG_VERSION}/HomebridgeDocker-x86_64-${PKG_VERSION}.spk $GITHUB_WORKSPACE/github-release/
