#!/bin/sh

SCRIPTPATH="$(dirname $(realpath $0))"

source "$SCRIPTPATH/source.sh"

echo "$(env)" > /tmp/env-dump

exec hb-service run -I -U /var/packages/homebridge/shares/homebridge
