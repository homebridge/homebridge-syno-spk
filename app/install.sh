#!/bin/sh

SCRIPTPATH="$(dirname $(realpath $0))"

source "$SCRIPTPATH/source.sh"

# install homebridge / homebridge ui
npm install -g --unsafe-perm homebridge@latest homebridge-config-ui-x@4.41.6-test.3
