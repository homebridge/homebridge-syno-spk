#!/bin/bash

source /pkgscripts/include/pkg_util.sh

package="HomebridgeDocker"
version="1.2.0"
maintainer="oznu"
displayname="Homebridge"
description="HomeKit support for the impatient using Docker on Synology DSM."
maintainer_url="https://github.com/oznu/docker-homebridge"
support_url="https://github.com/oznu/docker-homebridge/issues"
arch="x86 bromolow cedarview avoton braswell broadwell dockerx64 kvmx64 grantley denverton apollolake broadwellnk geminilake"
thirdparty="yes"
os_min_ver="6.1.3-15152"
install_dep_packages="Docker>=1.11.2"
dsmuidir="ui"
dsmappname="oznu.homebridge"
silent_install="no"
silent_upgrade="no"
qinst="false"
adminprotocol="http"
adminurl=""
adminport="8581"
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
