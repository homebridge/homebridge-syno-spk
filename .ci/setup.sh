#!/bin/bash

set -x

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
cp -R /root/.gnupg /toolkit/build_env/ds.x64-6.0/root/.gnupg

exit 0

mkdir /toolkit
cd /toolkit
git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git 

./pkgscripts-ng/EnvDeploy -q -v 6.0 -p x64




