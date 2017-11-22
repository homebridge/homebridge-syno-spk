#!/bin/bash

set -x

PKG_VERSION=$(cat $TRAVIS_BUILD_DIR/INFO.sh | grep version | awk -F '"' '{ print $2 }')

mkdir $TRAVIS_BUILD_DIR/github-release

cp /toolkit/result_spk/HomebridgeDocker-${PKG_VERSION}/HomebridgeDocker-x86_64-${PKG_VERSION}.spk $TRAVIS_BUILD_DIR/github-release/
