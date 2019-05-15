# Archnosh is nosh for Archlinux

This repository provides the build files necessary to integrate the [nosh](https://jdebp.eu/Softwares/nosh/) system and service manager with Archlinux package management.

The packaging here closely follows the [Debian packaging](https://jdebp.eu/Softwares/nosh/debian-binary-packages.html) provided by the author of nosh.


## How do I use it?

With caution! Installing some of the nosh packages provided here can profoundly change the way your system bootstraps and runs services.

Furthermore, the packages have so far been tested locally on virtual machines with minimum installs of early 2018 Archlinux releases and on a personal laptop, where they *do* work for the most part but tailoring to your system will be necessary.

*Caveat emptor.*


### The packages

This is a [split-package](https://www.archlinux.org/pacman/PKGBUILD.5.html#_package_splitting) PKGBUILD which will generate packages covering the toolset aswell as a service bundle collection which together can provide a complete working system.

Use the latest available released archive, i.e. the latest tagged git commit.

This README applies to the latest release.

Note that preset files will be handled as [config files](https://www.archlinux.org/pacman/pacman.8.html#_handling_config_files_a_id_hcf_a).

Service bundles, however, are a form of configuration via the filesystem and are less amenable to pacman's config file mechanism. Saving the run files under the `service` directory would reflect this configuration only partially. Currently therefore, in order to preserve customization through package upgrades, you should patch the systemd-like service files from which the bundles are generated.


#### Dependencies

The make dependencies are the following and require [AUR](https://wiki.archlinux.org/index.php/Aur) access to be set up:

* [pax](https://aur.archlinux.org/packages/pax/) (AUR)
* [redo-jdebp](https://aur.archlinux.org/packages/redo-jdebp/) (AUR)
* [xmlto](https://www.archlinux.org/packages/extra/x86_64/xmlto/) (Extra)
* [docbook-xml](https://www.archlinux.org/packages/extra/any/docbook-xml/) (Extra)
* [docbook-xsl](https://www.archlinux.org/packages/extra/any/docbook-xsl/) (Extra)

For [package building](https://wiki.archlinux.org/index.php/Arch_Build_System) in general, ensure the [base-devel](https://www.archlinux.org/groups/x86_64/base-devel/) package is installed.


#### Build and install the packages

Put the files in a directory and run:

    $ makepkg

You can then install the generated packages with:

    # pacman -U <package-name>

N.B.: due to a change in dbus-daemon behaviour and since nosh-1.37, `nosh-desktop-bus-shims` needs to override the `dbus-daemon-launch-helper` binary from the `core/dbus` Archlinux package with its own. While the Debian package uses the `dpkg-divert` mechanism, no similar method appears to exist on Arch (suggestions welcome).

The Archnosh package currently overwrites `/usr/lib/dbus-1.0/dbus-daemon-launch-helper`. This has two consequences:

* one must use the `--overwrite=usr/lib/dbus-1.0/dbus-daemon-launch-helper` option when installing with pacman to avoid a file collision error
* `nosh-desktop-bus-shims` now competes with `core/dbus` and must be reinstalled when the latter is updated.

In fact several nosh packages have files that may conflict with existing Archlinux packages. In some cases the packages are set to conflict in the `PKGBUILD` if nosh provides a complete replacement. In others, where nosh offers partial replacements such as for `core/dbus` above, the packages will not conflict and the [--overwrite option](https://www.archlinux.org/pacman/pacman.8.html#_upgrade_options_apply_to_em_s_em_and_em_u_em_a_id_uo_a) may be used to install them.

For example:

    # pacman -U nosh-core-shims-1.40-1-x86_64.pkg.tar.xz
    (...)
    error: failed to commit transaction (conflicting files)
    nosh-core-shims: /usr/bin/chroot exists in filesystem (owned by coreutils)
    nosh-core-shims: /usr/bin/false exists in filesystem (owned by coreutils)
    nosh-core-shims: /usr/bin/printenv exists in filesystem (owned by coreutils)
    nosh-core-shims: /usr/bin/true exists in filesystem (owned by coreutils)
    nosh-core-shims: /usr/share/man/man1/chroot.1.gz exists in filesystem (owned by coreutils)
    nosh-core-shims: /usr/share/man/man1/false.1.gz exists in filesystem (owned by coreutils)
    nosh-core-shims: /usr/share/man/man1/printenv.1.gz exists in filesystem (owned by coreutils)
    nosh-core-shims: /usr/share/man/man1/true.1.gz exists in filesystem (owned by coreutils)
    Errors occurred, no packages were upgraded.

    # pacman -U nosh-core-shims-1.40-1-x86_64.pkg.tar.xz --overwrite="*"

Of course, each install using `--overwrite` competes with its corresponding package and upgrades will have to be tracked somehow, to make sure the correct files are in use.


### Running nosh

Read the [timorous admin's installation how-to](https://jdebp.eu/Softwares/nosh/timorous-admin-installation-how-to.html).

The following describes the two expected common setups.

Both assume that you are running the default [systemd](https://wiki.archlinux.org/index.php/Systemd)-managed install.


#### nosh service manager only: nosh-run-via-systemd

It is possible to run nosh as a service manager alongside systemd.

The following packages are necessary:

* nosh-common
* nosh-exec
* nosh-service-management
* nosh-terminal-management
* nosh-bundles
* nosh-run-via-systemd
* nosh-run-debian-server-base or nosh-run-debian-desktop-base

Due to Archlinux's default preset *disable* policy (`/usr/lib/systemd/system-preset/99-default.preset`), you need to enable the following unit:

    # systemctl enable service-manager.socket

Then you should enable one or both of:

* system-control-normal.service
* service-manager-svscan.path

`system-control-normal.service` uses nosh [targets](https://jdebp.eu/Softwares/nosh/guide/anatomy-of-system-target.html) to bring up enabled services. Simply run `system-control enable <service>` and `systemctl disable <service>` for its equivalent in order to switch management of the service over to nosh.

`service-manager-svscan.path` will scan and bring up any service bundle you place in the `/service` directory (which you will have to create), effectively enabling it. This is the more typical daemontools [approach](https://cr.yp.to/daemontools/faq/create.html#why).

It's probably simpler to stick to just one of these methods.

Creating preset files for these units will also ensure their enabled/disabled status in case of package upgrades.

Also make sure to check the presets provided by the chosen `nosh-run-debian-X-base` package, they will activate *some* services by default.


#### nosh system and service manager: nosh-run-system-manager

For a fully nosh-managed system, i.e. nosh running as the init process and service manager, install the following packages:

* nosh-common
* nosh-exec
* nosh-execline-shims
* nosh-freebsd-shims
* nosh-service-management
* nosh-terminal-management
* nosh-bundles
* nosh-run-system-manager
* nosh-run-udev or nosh-run-systemd-udev
* nosh-run-kernel-vt
* nosh-run-debian-server-base or nosh-run-debian-desktop-base
* nosh-run-local-syslog
* nosh-run-klogd

Note that `nosh-run-system-manager` conflicts with `systemd-sysvcompat` which should be removed.

Installing these packages will raise a lot of the following errors:

    reset: ERROR: connect: /run/service-manager/control: No such file or directory

This is due to the fact that nosh isn't actually properly running yet but is not an issue. The system will work properly after a reboot (`system-control reboot`).


##### systemd-udev

The installation above assumes udev is the device manager, which is provided by the [systemd](https://www.archlinux.org/packages/core/x86_64/systemd/) package on Archlinux.

The easiest method is to simply use the binaries and configuration files provided by this package to run udev. The `nosh-run-systemd-udev` package will do just that and everything should work transparently. This means all udev configuration rules already set up should work as-is.


##### eudev

Alternatively you may wish to use the [eudev](https://wiki.gentoo.org/wiki/Eudev) implementation rather than keeping the systemd package for udev functionality.

We will detail the installation of [eudev](https://aur.archlinux.org/packages/eudev/), [libeudev](https://aur.archlinux.org/packages/libeudev/), [eudev-systemd](https://aur.archlinux.org/packages/eudev-systemd/) and [libeudev-systemd](https://aur.archlinux.org/packages/libeudev-systemd/) (available from the AUR) which should provide a drop-in replacement for systemd/udev.

1. Install libeudev

    This conflicts with the libsystemd package, you should remove it but it will almost certainly be a dependency for other packages on your system so run:

        # pacman -d -d -S libeudev

    The `-d` (or `--nodeps`) repeated option skips dependency checking. You will be providing replacements for these dependencies.

    It might also fail to install due to the following pre-existing files: `/usr/include/libudev.h` and `/usr/lib/pkgconfig/libudev.pc`. Remove these manually.

2. Install libeudev-systemd

    This will provide the `libsystemd.so` libraries.

3. Install eudev

    This conflicts with the systemd package and, again, will doubtless bring up many dependency warnings so run:
    
        # pacman -d -d -S eudev

4. Install eudev-systemd

    This will provide some shim systemd binaries and libraries.

The `nosh-run-udev` package will run the `udevd` binary, provided by eudev here.

From there you will have a working udev and some systemd shims which should allow installing most packages without too much trouble.

Run-packages for other device managers are provided: vdev, busybox-mdev and suckless-mdev. You will probably need to account for Archlinux's rather heavy systemd/udev integration in order to use them.


##### base presets

The `nosh-run-debian-X-base` packages have not currently been renamed but one of them must be used.

They provide essential presets for booting your system. The "desktop-base" extends the "server-base" presets.

Make sure to check, modify or add preset files where necessary in `/usr/share/system-control/presets`.

The `90-*-boot-essentials.preset` files, in particular, contain services for [mounting filesystems](https://jdebp.eu/Softwares/nosh/guide/fstab.html), for loading necessary kernel modules, service targets to achieve etc.


##### per-user service management

For user-controlled services, a [per-user manager](https://jdebp.eu/Softwares/nosh/guide/per-user-manager.html) can be enabled for user *my_user* with:

    # system-control enable user@my_user

This will start [per-user service management](https://jdebp.eu/Softwares/nosh/guide/per-user-system-services.html) for *my_user* on system boot.

Default user service bundles are generated by users running `redo all` in their `$HOME/.config/service-bundles/convert/` directory.

Additional user service bundles can be placed under `$HOME/.config/service-bundles/services/` and controlled with:

    $ system-control --user <command>


##### networking

Service bundles are available for various network managers, such as Wicd and NetworkManager.

Native network configuration is also [available](https://jdebp.eu/Softwares/nosh/guide/networking.html).

It can be achieved, via the [rc.conf amalgamation](https://jdebp.eu/Softwares/nosh/guide/rcconf-amalgamation.html) mechanism, by writing a [Debian-style](https://wiki.debian.org/NetworkConfiguration) `/etc/network/interfaces` file or directly in [FreeBSD-style](https://www.freebsd.org/doc/handbook/config-network-setup.html) within `/etc/rc.conf`.

A `dhcpcd@` service (the [default enabled tool](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_Internet) for wired devices on Archlinux) is generated for each interface and is preset enabled by `90-linux-static-networking.preset`.

It should be enabled automatically (on interfaces configured with dhcp of course). The discovery script will detect [dhclient](https://www.isc.org/downloads/dhcp/), [udhcpc](https://udhcp.busybox.net/) and [dhcpcd](https://roy.marples.name/projects/dhcpcd). You can manually set your client in `/etc/rc.conf` or `/etc/rc.conf.local` with the `dhclient_program` variable.

Don't forget to run `redo all` after applying configuration changes. Check `/etc/system-control/convert/static-networking` to make sure the desired services for your interface are set to `on`.


##### non-root Xorg and device access

Since we are not using systemd's `logind`, starting X as an unpriviledged user requires adding that user to the "input" and "video" groups.

See [https://wiki.gentoo.org/wiki/Non_root_Xorg](https://wiki.gentoo.org/wiki/Non_root_Xorg) for further details.

In the same vein, other device access may no longer work for unpriviledged users. You will probably have to add users to the "audio" group to use a soundcard for instance.

[elogind](https://github.com/elogind/elogind) might conceivably be used to achieve systemd behaviour here.


##### shims

Various "shim" packages exist to provide the following:

1. Commands from other service or system managers that will invoke the corresponding nosh management actions, e.g. nosh-debian-shims, nosh-systemd-shims, nosh-upstart-shims, etc.

2. Utilities which may be provided by other packages, e.g. nosh-execline-shims, nosh-ucspi-tcp-shims, nosh-kbd-shims, etc.


##### virtual terminals

Rather than kernel virtual terminals, [user-space virtual terminals](https://jdebp.eu/Softwares/nosh/guide/user-virtual-terminals.html) may be used by installing `nosh-run-user-vt`.

The `nosh-execline-shims` package is necessary if you do not have [execline](https://skarnet.org/software/execline/) available.

Also ensure that you have the proper [resources](https://jdebp.eu/Softwares/nosh/guide/terminal-resources.html) available to use the virtual terminals.


##### troubleshooting and exceptional boot modes

A [troubleshooting](https://jdebp.eu/Softwares/nosh/guide/troubleshooting.html) page is available for potential issues aswell as a [gazetteer](https://jdebp.eu/Softwares/nosh/guide/gazetteer.html) to find the location of relevant files.

In certain cases your system may need to be booted in an [exceptional mode](https://jdebp.eu/FGA/emergency-and-rescue-mode-bootstrap.html).

* A *rescue mode* is available for nosh by appending "s" to the kernel boot parameters.

* An *emergency mode* is available by appending "b" to the kernel boot parameters.


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
* etc.

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

The `service` directory contains the scripts used to run the service. `service/env` can be used to store configuration information.

The `supervise` directory contains the control/status API files.


### logging

Logging is a service on par with any other. In general one logging service is associated with each daemon to capture and manage its output (log rotation, size capping etc.) although fan-in from multiple services to one logging service is also possible.

The daemontools [assumption](https://jdebp.eu/FGA/unix-daemon-design-mistakes-to-avoid.html) is that daemons log to their standard error, *not* to syslog. Specialised logging tools can then be used to manage this output.

More generally, daemons are expected not to implement functions such as dropping privileges, socket management, resource limiting, etc. which could be provided by external tools, typically the daemontools family toolsets and other service managers (see the same argument for systemd's ["new-style"](https://www.freedesktop.org/software/systemd/man/daemon.html) daemons).

In practice, nosh [connects](https://jdebp.eu/Softwares/nosh/guide/log-service-plumbing.html) a service's standard output and error to the service pointed to by the "log" directory of the service bundle. Below are some excerpts of the `lsof` command to illustrate:

    COMMAND   PID     USER   FD      TYPE             DEVICE SIZE/OFF   NODE NAME

    # the sshd service, file descriptors 1 and 2 refer to pipe 17119
    tcp-socke 976     root  cwd       DIR              254,0     4096 198091 /var/sv/sshd/service
    tcp-socke 976     root  txt       REG              254,0   212968  62095 /usr/bin/tcp-socket-accept
    tcp-socke 976     root    0r     FIFO               0,10      0t0  17188 pipe
    tcp-socke 976     root    1w     FIFO               0,10      0t0  17119 pipe
    tcp-socke 976     root    2w     FIFO               0,10      0t0  17119 pipe

    # the cyclog@sshd service, file descriptor 0 refers to pipe 17119: reading sshd's stdout and stderr
    cyclog    963 sshd-log  txt       REG              254,0   212968  63713 /usr/bin/cyclog
    cyclog    963 sshd-log    0r     FIFO               0,10      0t0  17119 pipe
    cyclog    963 sshd-log    1w     FIFO               0,10      0t0   8409 pipe
    cyclog    963 sshd-log    2w     FIFO               0,10      0t0   8409 pipe
    cyclog    963 sshd-log    6w      REG              254,0        0 202749 /var/log/sv/sshd/current

    # note that cyclog@sshd's own stdout and stderr point to pipe 8409 which is actually the system-wide logger's input
    cyclog    163     root  txt       REG              254,0   130984  63711 /usr/bin/system-manager
    cyclog    163     root    0r     FIFO               0,10      0t0   8409 pipe
    cyclog    163     root    1u      CHR                5,1      0t0   6547 /dev/console (deleted)
    cyclog    163     root    2u      CHR                5,1      0t0   6547 /dev/console (deleted)
    cyclog    163     root    5w      REG               0,18    81718   8433 /run/system-manager/log/current

    # ... just as init's own stdout and stderr also point to the system-wide cyclog
    init        1     root  txt       REG              254,0   130984  63711 /usr/bin/system-manager
    init        1     root    0r      CHR                1,3      0t0   6465 /dev/null
    init        1     root    1w     FIFO               0,10      0t0   8409 pipe
    init        1     root    2w     FIFO               0,10      0t0   8409 pipe

The "log" directory name is a bit misleading insofar as one could chain anything to the service and create an arbitrarily long pipe chain. That being said, service `run` files already use [chain-loading mechanisms](https://jdebp.eu/Softwares/nosh/guide/chain-loading-cheatsheet.html) so it generally really is a logging service that is ultimately piped to.


### system-control

[system-control](https://jdebp.eu/Softwares/nosh/guide/system-control.html) is the system workhorse command from a user perspective.

It provides high-level system-wide and per-user service management (start/stop, enable/disable etc.) aswell as system management (reboot, poweroff etc.) and various other specialised commands for e.g. converting systemd-style unit files to service bundles.


### Converting systemd unit files

`system-control convert-systemd-units <unit-file>` supports conversion for [various types](https://jdebp.eu/Softwares/nosh/guide/converting-systemd-units.html) of systemd unit files to service bundles.

It also understands extended syntax to express service bundle-specific functionality in a systemd-like unit file, which can be used for easy distribution for example.

In other words, one can benefit from existing systemd unit files through automatic conversion in most cases.


## Automation

Basic support for service management is available with the [Ansible nosh module](http://docs.ansible.com/ansible/latest/modules/nosh_module.html#nosh-module).


## Repositories

This repository is publicly available at the following locations:

1. [https://framagit.org/taca/archnosh](https://framagit.org/taca/archnosh)
2. [https://repo.or.cz/archnosh.git](https://repo.or.cz/archnosh.git)
3. [https://github.com/tacatac/archnosh](https://github.com/tacatac/archnosh)


## License

These packaging configuration files are distributed under the public domain [Unlicense](https://unlicense.org/), see the UNLICENSE file provided.

The nosh software, however, is distributed under BSD/BSD-compatible licensing.
