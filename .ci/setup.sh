#!/bin/bash

set -x 

sudo mkdir /toolkit
cd /toolkit
sudo git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git 

sudo ./pkgscripts-ng/EnvDeploy -q -v 6.0 -p x64


