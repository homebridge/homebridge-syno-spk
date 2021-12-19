#!/bin/bash

set -x
set -e

apt-get update
apt-get install -y cifs-utils python3 python3-pip jq

mkdir -p /toolkit
cd /toolkit
git clone https://github.com/SynologyOpenSource/pkgscripts-ng
cd /toolkit/pkgscripts-ng/
git checkout DSM7.0

/toolkit/pkgscripts-ng/EnvDeploy -v 7.0 -p braswell
