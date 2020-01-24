[![Travis](https://img.shields.io/travis/oznu/homebridge-syno-spk.svg)](https://travis-ci.org/oznu/homebridge-syno-spk) [![GitHub release](https://img.shields.io/github/release/oznu/homebridge-syno-spk.svg)](https://github.com/oznu/homebridge-syno-spk/releases/latest)

![oznu/homebridge-homekit-logo](PACKAGE_ICON.PNG)

# Synology Package for Homebridge Docker

This third-party Synology Package simplifies the process of running [Homebridge](https://github.com/nfarina/homebridge) on devices that support Docker and are running DSM 6.1.3 or later.

This package will deploy the [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) image using the recommended settings:

* `--net=host` is set automatically.
* `-e TZ` variable is set based on your current timezone of your Synology NAS.
* `-e PUID` variable is set to the same UID as the user who installs the package in DSM.
* `-e PGID` variable is set to the same GID as the user who installs the package in DSM.
* `-v /homebridge` is setup automatically using the directory chosen by you during installation.

## How to install

**Step 1:** Download the latest `.spk` from here: https://github.com/oznu/homebridge-syno-spk/releases/latest

**Step 2:** Open Package Center in DSM and select the `Manual Install` option.

**Step 3:** Click `Yes` when warned about using a package from an unknown publisher.

**Step 4:** Enter the path where you want Homebridge to store it's config.

**Step 5:** Complete the wizard. The first time you install may take some time as the latest [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) image is downloaded from Docker Hub.

**Step 6:** Use the Homebridge app icon in the main menu to access the Homebridge UI where you can manage your setup.

![oznu/homebridge-config-ui-x](https://raw.githubusercontent.com/oznu/homebridge-config-ui-x/master/screenshots/homebridge-config-ui-x-status.png)

The Homebridge Config UI app starts on port `8581`. The default username is **admin** with password **admin**.

## Updating Homebridge

Homebridge can be updated from inside the Config UI. From time to time you may need to upgrade the [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) Docker container image which can be done by stopping and starting the package in the Synology DSM Package Center.

## Adding Additional Packages

Some plugins may require additional packages to be installed which can be done by editing the `startup.sh` script.

The `startup.sh` file will be created in the volume you choose during the setup wizard. You can edit this file from the UI by going to the Docker menu -> Startup Script.

Example `startup.sh` file to install `ffmpeg`:

```shell
#!/bin/sh

apk add --no-cache ffmpeg ffmpeg-libs
```

Example `startup.sh` file to install `libpcap-dev`:


```shell
#!/bin/sh

apk add --no-cache libpcap-dev
```

**To apply the changes made to the `startup.sh` file you need to restart the entire container using the Docker app in DSM.**

## Issues

If you have an issue with the installation of Homebridge using this package please raise an issue on this project's GitHub page. For everything else:

* Docker/Platform Issues: [oznu/docker-homebridge](https://github.com/oznu/docker-homebridge)
* Homebridge Conifg UI Issues: [oznu/homebridge-config-ui-x](https://github.com/oznu/homebridge-config-ui-x)
* General Homebridge Issues: [nfarina/homebridge](https://github.com/nfarina/homebridge)
* For problems with individual plugins please raise issues on the relevant GitHub project page.

Some users have reported not being able to get Homebridge to work at all on their Synology NAS while Bonjour is activated, see [this issue](https://github.com/oznu/docker-homebridge/issues/35) for more details.

## Contributing

Pull requests are welcome.

## Setting up for development

See the [Synology DSM 6.0 Developer Guide](https://developer.synology.com/developer-guide/index.html).

## License

Copyright (C) 2017-2020 oznu

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the [GNU General Public License](./LICENSE) for more details.
