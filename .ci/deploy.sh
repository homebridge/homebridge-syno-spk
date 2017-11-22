#!/bin/bash

set -x

mkdir $TRAVIS_BUILD_DIR/github-release
rm -rf /toolkit/result_spk/*_debug.spk
cp -R /toolkit/result_spk/*.spk $TRAVIS_BUILD_DIR/github-release/

