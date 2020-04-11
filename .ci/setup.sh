#!/bin/bash

set -x
set -e

# create base
mkdir /toolkit
cd /toolkit

# get syno build tools
git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git 

# deploy chroot env
./pkgscripts-ng/EnvDeploy -q -v 6.0 -p x64
