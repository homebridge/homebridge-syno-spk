#!/bin/bash

set -x 

mkdir /toolkit
cd /toolkit
git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git 

./pkgscripts-ng/EnvDeploy -q -v 6.0 -p x64


