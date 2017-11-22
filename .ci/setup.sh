#!/bin/bash

set -x

# create base
mkdir /toolkit
cd /toolkit

# get syno build tools
git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git 

# deploy chroot env
./pkgscripts-ng/EnvDeploy -q -v 6.0 -p x64

# this gpg key is never going to be validated so it does not need to be secure
cat >foo <<EOF
     Key-Type: RSA
     Key-Length: 2048
     Subkey-Type: RSA
     Subkey-Length: 2048
     Name-Real: @oznu
     Name-Comment: not my real gpg key
     Name-Email: dev@oz.nu
     Expire-Date: 0
     Passphrase: abc
     %commit
     %echo done
EOF

gpg --batch --gen-key foo

# copy gpg keys into chroot env
mkdir -p /toolkit/build_env/ds.x64-6.0/home/travis/
cp -R /home/travis/.gnupg /toolkit/build_env/ds.x64-6.0/root/.gnupg
cp -R /home/travis/.gnupg /toolkit/build_env/ds.x64-6.0/home/travis/.gnupg
chown -R root:root /toolkit/build_env/ds.x64-6.0/root/.gnupg /toolkit/build_env/ds.x64-6.0/home/travis/.gnupg
chmod -R 600 /toolkit/build_env/ds.x64-6.0/root/.gnupg /toolkit/build_env/ds.x64-6.0/home/travis/.gnupg

# move build files into source dir
mkdir -p /toolkit/source
cp -R $TRAVIS_BUILD_DIR /toolkit/source/homebridge-syno-spk

# build spk
./pkgscripts-ng/PkgCreate.py -c homebridge-syno-spk


