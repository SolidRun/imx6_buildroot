# imx6_buildroot
# SolidRun's i.MX6 based  build scripts

## Introduction
Main intention of this repository is to build a buildroot based build environment for i.MX6 based products.

The build script provides ready to use images that can be deployed on a micro SD card.

##  Source code versions

- [U-boot 2022.04](https://github.com/u-boot/u-boot/tree/v2022.04)
- [Linux kernel 5.18](https://github.com/torvalds/linux/tree/v5.18)
- [Buildroot 2022.05](https://github.com/buildroot/buildroot/tree/2022.05)

## Building Image

The build script will check for required tools, clone and build images and place results in output/ directory.

### Docker build (recommended)

* Build the Docker image (<b>Just once</b>):

```
docker build --build-arg user=$(whoami) --build-arg userid=$(id -u) -t imx6 docker/
```

To check if the image exists in you machine, you can use the following command:

```
docker images | grep imx6
```

* Run the build script:
```
docker run --rm -it -v "$PWD":/imx6_build/imx6_buildroot imx6:latest /bin/bash
# Run the build script
cd /imx6_build/imx6_buildroot && ./runme.sh
```

To Delete all containers:
```
docker rm -f $(docker ps -a -q)
```

### Native Build
Simply:

```
./runme.sh
```

## Deploying
In order to create a bootable SD card, plug in a micro SD into your machine and run the following, where sdX is the location of the SD card got probed into your machine -

```
umount /media/<relevant directory>
sudo dd if=output/microsd-<hash>.img of=/dev/sdX
```

---
**NOTE**

If you use **HummingBoard CBI** Carrier board, you should change the U-Boot environment is_cbi for 'no' to 'yes' to enable the RS485 & CanBus interface, you can use the U-boot commands below:
```
setenv is_cbi yes; saveenv; boot
```
#Interface's testing
| Interface  | Status |
| ------------- | ------------- |
| Ethernet - eth0  | OK  |
| Wifi - wlan0  | scaning works, wasn't able to connect to wifi , getting "wlan0: deauthenticating from 42:88:09:a4:99:a2 by local choice (Reason: 3=DEAUTH_LEAVING)" |
| USB  | OK  |
| HDMI  | OK |
| SD-CARD | OK  |
| LTE Modem  | OK  |
| Infrared | OK |
| Bluetooth  | Dosen't work, getting error [  187.377588] Bluetooth: hci0: download firmware failed, retrying...[  248.807825] Bluetooth: hci0: request_firmware failed(errno -110) for ti-connectivity/TIInit_11.8.32.bts[  248.817647] Bluetooth: hci0: download firmware failed, retrying...|
| SoundCard  | Dosen't work  |
| M.2 | NOT TESTED  |
