#!/bin/bash

source /pkgscripts/include/pkg_util.sh

package="HomebridgeDocker"
version="1.0.1"
maintainer="oznu"
displayname="Homebridge Docker"
description="HomeKit support for the impatient using Docker on Synology DSM."
maintainer_url="https://github.com/oznu/docker-homebridge"
support_url="https://github.com/oznu/docker-homebridge/issues"
arch="$(pkg_get_unified_platform)"
thirdparty="yes"
os_min_ver="6.1.4-15217"
install_dep_packages="Docker>=17.05.0"
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
