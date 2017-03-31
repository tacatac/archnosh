# Archnosh is nosh for Archlinux

This repository provides the build files necessary to integrate the [nosh](https://jdebp.eu/Softwares/nosh/) system and service manager with Archlinux package management.

The packaging here closely follows the [Debian packaging](https://jdebp.eu/Softwares/nosh/debian-binary-packages.html) provided by the author of nosh.

## How do I use it?

With caution! Installing some of the nosh packages provided here can profoundly change the way your system bootstraps and runs services.

Furthermore, the packages have so far only been tested on virtual machines with bare minimum installs of early 2017 Archlinux releases, where they *do* work for the most part but tailoring to your system will be necessary.

**N.B.: Automatic network configuration currently does not work with Archlinux, network interfaces may have to be brought up and configured manually.**

*Caveat emptor.*

### The packages

This is a split-package PKGBUILD which will generate several packages, covering the toolset aswell as a service bundle collection which together can provide a complete working system.

#### Dependencies

The make dependencies are the following and require [AUR](https://wiki.archlinux.org/index.php/Aur) access to be set up:

* [pax](https://aur.archlinux.org/packages/pax/) (AUR)
* [redo-jdebp](https://aur.archlinux.org/packages/redo-jdebp/) (AUR)
* [libtinfo](https://aur.archlinux.org/packages/libtinfo/) (AUR)
* [xmlto](https://www.archlinux.org/packages/extra/x86_64/xmlto/) (Extra)
* [docbook-xml](https://www.archlinux.org/packages/extra/any/docbook-xml/) (Extra)
* [docbook-xsl](https://www.archlinux.org/packages/extra/any/docbook-xsl/) (Extra)

For package building in general, ensure the [base-devel](https://www.archlinux.org/groups/x86_64/base-devel/) package is installed.

#### Build the packages

Put the files in a directory and run:

    $ makepkg

You can then install the generated packages with:

    $ pacman -U <package-name>

### Running nosh

Read the [timorous admin's installation how-to](https://jdebp.eu/Softwares/nosh/timorous-admin-installation-how-to.html).

The following describes the two expected common setups. Both assume you are running a default systemd-managed install.

#### nosh service manager only: nosh-run-via-systemd

The current default system and service manager for Archlinux is [systemd](https://wiki.archlinux.org/index.php/Systemd).

It is possible to run nosh as a service manager alongside systemd.

The following packages are necessary:

* nosh-common
* nosh-exec
* nosh-service-management
* nosh-terminal-management
* nosh-bundles
* nosh-run-via-systemd
* nosh-run-debian-server-base

Due to Archlinux's default preset *disable* policy (/usr/lib/systemd/system-preset/99-default.preset), you need to enable the following unit:

    # systemctl enable service-manager.socket

Then you should enable one or both of:

* system-control-normal.service
* service-manager-svscan.path

`system-control-normal.service` uses nosh targets to bring up enabled services. Simply run `system-control enable <service>` and `systemctl disable <service>` for its equivalent in order to switch management of the service over to nosh.

`service-manager-svscan.path` will scan and bring up any service bundle you place in the /service directory (which you will have to create), effectively enabling it. This is the more typical daemontools [approach](https://cr.yp.to/daemontools/faq/create.html#why).

It's probably simpler to stick to just one of these methods.

Creating preset files for these units will also ensure their enabled/disabled status in case of package upgrades.

#### nosh system and service manager: nosh-run-system-manager

For a fully nosh-managed system i.e. nosh running as the init process and service manager, install the following packages:

* nosh-common
* nosh-exec
* nosh-execline-shims
* nosh-service-management
* nosh-terminal-management
* nosh-bundles
* nosh-run-system-manager
* nosh-run-udev
* nosh-run-kernel-vt
* nosh-run-debian-server-base
* nosh-run-local-syslog
* nosh-run-klogd

##### udev

The above installation assumes udev is the device manager, which is provided by the [systemd](https://www.archlinux.org/packages/core/x86_64/systemd/) package on Archlinux. However, using that package's `systemd-udevd` and `udevadm` commands with nosh has proven unsuccessful. If you know of any way to make it work, let me know.

Instead we will detail the installation of [eudev](https://aur.archlinux.org/packages/eudev/), [libeudev](https://aur.archlinux.org/packages/libeudev/), [eudev-systemd](https://aur.archlinux.org/packages/eudev-systemd/) and [libeudev-systemd](https://aur.archlinux.org/packages/libeudev-systemd/) (available from the AUR) which should provide a drop-in replacement for systemd/udev.

Alternative device manager run-packages are provided (vdev, busybox-mdev, suckless-mdev) but you will have to account for Archlinux systemd/udev integration with various other system packages.

N.B.: the current `eudev-3.2.1-2` package, which provides `eudev` and `libeudev`, fails to build with an up-to-date system due to an issue with gperf which has been [fixed upstream](https://github.com/gentoo/eudev/commit/5bab4d8de0dcbb8e2e7d4d5125b4aea1652a0d60) but not released in a versioned archive. This has been pointed out to the Archlinux package maintainer. Until it is fixed, you will have to patch it yourself or build from the latest sources.

1. Install libeudev

    This conflicts with the libsystemd package, you should remove it but it will almost certainly be a dependency for other packages on your system so run:

        # pacman -dd -S libeudev

    The `-dd` (or `--nodeps`) repeated option skips dependency checking. You will be providing replacements for these dependencies.

    It might also fail to install due to the following pre-existing files: `/usr/include/libudev.h` and `/usr/lib/pkgconfig/libudev.pc`. Delete these manually.

2. Install libeudev-systemd

    This will provide the `libsystemd.so` libraries.

3. Install eudev

    This conflicts with the systemd package and, again, will doubtless bring up many dependency warnings so run:
    
        # pacman -dd -S eudev

4. Install eudev-systemd

    This will provide some shim systemd binaries and libraries.


##### virtual terminals

Rather than kernel virtual terminals, [user-space virtual terminals](https://jdebp.eu/Softwares/nosh/user-vt-screenshots.html) may be used by installing `nosh-run-user-vt`.

The `nosh-execline-shims` package is necessary if you do not have [execline](https://skarnet.org/software/execline/) available.

##### base

`nosh-run-debian-server-base` has currently not been renamed... 

It provides essential presets for booting your system. A more featureful `nosh-run-debian-desktop-base` is also available.

##### shims

Various shim packages exist to provide the following:

1. Commands from other service or system managers that will invoke the corresponding nosh management actions, e.g. nosh-debian-shims, nosh-systemd-shims, nosh-upstart-shims...

2. Utilities which may be provided by other packages, e.g. nosh-execline-shims, nosh-ucspi-tcp-shims, nosh-kbd-shims...

##### troubleshooting

[https://jdebp.eu/Softwares/nosh/guide/troubleshooting.html](https://jdebp.eu/Softwares/nosh/guide/troubleshooting.html)

The link above may come in useful.

## Some nosh guidelines

The online [nosh guide](https://jdebp.eu/Softwares/nosh/guide/), also available in the `nosh-guide` package, and command [manpages](https://jdebp.eu/Softwares/nosh/guide/commands.html) provide comprehensive documentation.

The nosh toolset follows general [daemontools design](https://jdebp.eu/FGA/daemontools-family.html) which includes:

* using the filesystem as database and API: the system can be inspected and modified using standard filesystem commands
* logging as an ordinary --"first-class citizen"-- service
* chain-loading of simple utilities to build a controlled final running state
* composability: utilities from other toolsets in this family can be used in conjunction with nosh

To these features nosh [adds](https://jdebp.eu/Softwares/nosh/guide/new-interfaces.html):

* explicit separation of *service* and *system* management
* terminal management
* service ordering and interdependency through "service bundles" which allows for system "targets" similar to systemd
* restart scripts

For a general presentation you may read the following:

[https://jdebp.eu/Softwares/nosh/guide/introduction.html](https://jdebp.eu/Softwares/nosh/guide/introduction.html)


### Service bundles

A standard bundle will look something like this:

    /var/sv $ tree kamailio
    kamailio
    ├── after
    │   ├── basic -> /etc/service-bundles/targets/basic
    │   └── log -> ../log
    ├── before
    │   └── shutdown -> /etc/service-bundles/targets/shutdown
    ├── conflicts
    ├── log -> ../cyclog@kamailio
    ├── required-by
    ├── service
    │   ├── env
    │   ├── restart
    │   ├── run
    │   ├── start
    │   └── stop
    ├── stopped-by
    │   └── shutdown -> /etc/service-bundles/targets/shutdown
    ├── supervise
    │   ├── control
    │   ├── lock
    │   ├── ok
    │   └── status
    ├── wanted-by
    │   └── server -> /etc/service-bundles/targets/server
    └── wants
        └── basic -> /etc/service-bundles/targets/basic

The `before` and `after` directories allow for linking to other service bundles to set *ordering constraints*.

The `conflicts`, `required-by`, `stopped-by`, `wanted-by` and `wants` directories allow for linking to other service bundles to set *dependency constraints*.

The `log` directory points to a logging service.

The `service` directory contains the scripts used to manage the service. `service/env` can be used to store configuration information.

The `supervise` directory contains the control/status API files.

### system-control

[system-control](https://jdebp.eu/Softwares/nosh/guide/system-control.html) is the workhorse command for the system.

It provides general service management (start/stop, enable/disable etc.) aswell as system management (reboot, poweroff etc.) and various other specialised commands for e.g. converting systemd-style unit files to service bundles.

### Converting systemd unit files

`system-control convert-systemd-units <unit-file>` supports conversion for [various types](https://jdebp.eu/Softwares/nosh/guide/converting-systemd-units.html) of systemd unit files to service bundles.

It also understands extended syntax to express service bundle-specific functionality in a systemd-like unit file, which can be used for easy distribution for example.

In other words, one can benefit from existing systemd unit files through automatic conversion in many cases.

## Repositories

This repository is publicly available at the following locations:

1. [https://framagit.org/taca/archnosh](https://framagit.org/taca/archnosh)
2. [https://repo.or.cz/archnosh.git](https://repo.or.cz/archnosh.git)
3. [https://github.com/tacatac/archnosh](https://github.com/tacatac/archnosh)

## License

These packaging configuration files are distributed under the public domain [Unlicense](https://unlicense.org/), see the UNLICENSE file provided.

The nosh software, however, is distributed under BSD/BSD-compatible licensing.
