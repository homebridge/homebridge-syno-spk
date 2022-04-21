#!/bin/sh

SCRIPTPATH="$(dirname $(realpath $0))"
HB_SERVICE_STORAGE_PATH="$(readlink -f /var/packages/homebridge/shares/homebridge)"

source "$SCRIPTPATH/source.sh"

# install homebridge / homebridge ui
cd $HB_SERVICE_STORAGE_PATH
pnpm install --unsafe-perm homebridge@latest homebridge-config-ui-x@4.43.1-test.7
