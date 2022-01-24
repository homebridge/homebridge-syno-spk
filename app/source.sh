#!/bin/sh

SCRIPTPATH="$(dirname $(realpath $0))"

echo $SCRIPTPATH

nodeBin="$SCRIPTPATH/bin"
npmGlobalDir="$(dirname $(dirname $(dirname $SCRIPTPATH)))/@appdata/homebridge"

export PATH="$SCRIPTPATH/bin:$npmGlobalDir/bin:/opt/bin:/var/packages/ffmpeg/target/bin:$PATH"
export PYTHON=/usr/bin/python3.8

export npm_config_prefix=$npmGlobalDir
export npm_config_global_style=true
export npm_config_audit=false
export npm_config_fund=false

export HOMEBRIDGE_SYNOLOGY_PACKAGE=1
