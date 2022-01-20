<p align="center">
<img width="400px" src="https://user-images.githubusercontent.com/3979615/79035227-bdd5be00-7bff-11ea-900f-2fef01bba4ba.png">
</p>

[![GitHub release](https://img.shields.io/github/release/oznu/homebridge-syno-spk.svg)](https://github.com/oznu/homebridge-syno-spk/releases/latest)
[![Build](https://github.com/oznu/homebridge-syno-spk/workflows/Build/badge.svg)](https://github.com/oznu/homebridge-syno-spk/actions)
[![Donate](https://badgen.net/badge/donate/paypal/yellow)](https://paypal.me/oznu)

# Homebridge Package for Synology DSM

This third-party Synology Package simplifies the process of running [Homebridge](https://github.com/nfarina/homebridge) on x86_64 Synology NAS devices.

## DSM 7

**To use this package on DSM 7, your Synology NAS must have an Intel or AMD x86_64 based CPU.**

This package will deploy Homebridge and the Homebridge UI natively on your Synology NAS. It will create a new shared named `homebridge` to store the Homebridge configuration and user data.

**Step 1:** Download the `.spk` from here: https://github.com/oznu/homebridge-syno-spk/releases/tag/2.2.0

**Step 2:** Open Package Center in DSM and select the `Manual Install` option.

**Step 3:** Click `Agree` when warned about using a package from an unknown publisher.

**Step 4:** Click `Done` to confirm installation. This may take some time as the latest version of Homebridge is downloaded and installed.

**Step 5:** Use the Homebridge app icon in the main menu to access the Homebridge UI where you can manage your setup.

The Homebridge Config UI app starts on port `8581`. The default username is **admin** with password **admin**.

## DSM 6

**To use this package on DSM 6, you must have the Synology Docker Package installed.**

This package will deploy the [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) image using the recommended settings.

**Step 1:** Download the `.spk` from here: https://github.com/oznu/homebridge-syno-spk/releases/tag/1.3.0

**Step 2:** Open Package Center in DSM and select the `Manual Install` option.

**Step 3:** Click `Yes` when warned about using a package from an unknown publisher.

**Step 4:** Enter the path where you want Homebridge to store it's config.

**Step 5:** Complete the wizard. The first time you install may take some time as the latest [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) image is downloaded from Docker Hub.

**Step 6:** Use the Homebridge app icon in the main menu to access the Homebridge UI where you can manage your setup.

The Homebridge Config UI app starts on port `8581`. The default username is **admin** with password **admin**.

From time to time you may need to upgrade the [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) Docker container image which can be done by stopping and starting the package in the Synology DSM Package Center.

## Issues

If you have an issue with the installation of Homebridge using this package please raise an issue on this project's GitHub page. For everything else:

* Docker/Platform Issues: [oznu/docker-homebridge](https://github.com/oznu/docker-homebridge)
* Homebridge Conifg UI Issues: [oznu/homebridge-config-ui-x](https://github.com/oznu/homebridge-config-ui-x)
* General Homebridge Issues: [nfarina/homebridge](https://github.com/nfarina/homebridge)
* For problems with individual plugins please raise issues on the relevant GitHub project page.

## Contributing

Pull requests are welcome.

## Setting up for development

See the [Synology DSM Developer Guide](https://help.synology.com/developer-guide/).

## License

Copyright (C) 2017-2022 oznu

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the [GNU General Public License](./LICENSE) for more details.
