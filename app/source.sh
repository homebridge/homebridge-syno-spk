#!/bin/sh

nodeBin="$(readlink -f /var/packages/homebridge/target)/app/bin"
npmGlobalDir="$(readlink -f /var/packages/homebridge/var)"

export PATH="$nodeBin:$npmGlobalDir/bin:/opt/bin:/var/packages/ffmpeg/target/bin:$PATH"
export PYTHON=/usr/bin/python3.8

export npm_config_prefix=$npmGlobalDir
export npm_config_global_style=true
export npm_config_audit=false
export npm_config_fund=false

export HOMEBRIDGE_SYNOLOGY_PACKAGE=1
