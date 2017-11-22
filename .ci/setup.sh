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
gpg -k

# copy gpg keys into chroot env
cp -R /home/travis/.gnupg /toolkit/build_env/ds.x64-6.0/root/.gnupg



