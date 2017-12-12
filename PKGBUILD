# Maintainer:  taca <taca@kadisius.eu>

pkgbase=nosh
pkgname=(
    'nosh-common'
    'nosh-guide'
    'nosh-zsh-completion'
    'nosh-exec'
    'nosh-execline-shims'
    'nosh-core-shims'
    'nosh-service-management'
    'nosh-terminal-management'
    'nosh-run-system-manager'
    'nosh-ucspi-tcp-shims'
    'nosh-terminal-extras'
    'nosh-systemd-shims'
    'nosh-systemv-shims'
    'nosh-upstart-shims'
    'nosh-debian-shims'
    'nosh-openbsd-shims'
    'nosh-bsd-shims'
    'nosh-freebsd-shims'
    'nosh-kbd-shims'
    'nosh-bundles'
    'nosh-run-via-systemd'
    'nosh-run-kernel-vt'
    'nosh-run-udev'
    'nosh-run-systemd-udev'
    'nosh-run-busybox-mdev'
    'nosh-run-suckless-mdev'
    'nosh-run-vdev'
    'nosh-run-user-vt'
    'nosh-run-freedesktop-system-bus'
    'nosh-run-freedesktop-kits'
    'nosh-run-virtualbox-guest'
    'nosh-run-klog'
    'nosh-run-local-syslog'
    'nosh-run-debian-server-base'
    'nosh-run-debian-desktop-base'
    'nosh-run-openssh-server'
    )               
pkgver=1.36
pkgrel=1
pkgdesc="A suite of system-level utilities for initializing and running a BSD or Linux system, for managing daemons, for managing terminals, and for managing logging."
arch=('x86_64')
url="https://jdebp.eu/Softwares/nosh/index.html"
license=('custom:MIT Expat' 'custom:FreeBSD' 'custom:ISC' 'custom:Simplified BSD')
groups=()
depends=()
makedepends=('pax' 'docbook-xml' 'docbook-xsl' 'xmlto' 'redo-jdebp')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=""
changelog="archnosh.changelog"

# packages with maintenance scripts
_pkginstalls=( 
        "nosh-bundles"
        "nosh-run-klog"
        "nosh-run-user-vt"
        "nosh-run-local-syslog"
        "nosh-run-via-systemd"
        "nosh-run-busybox-mdev"
        "nosh-run-openssh-server"
        "nosh-run-via-systemd"
        "nosh-run-freedesktop-kits"
        "nosh-run-suckless-mdev"
        "nosh-run-freedesktop-system-bus"
        "nosh-run-system-manager"
        "nosh-run-virtualbox-guest"
        "nosh-run-kernel-vt"
        "nosh-run-udev"
        "nosh-run-systemd-udev"
        "nosh-run-debian-server-base"
        "nosh-run-debian-desktop-base"
        "nosh-run-openssh-server"
        )
        
# no point in distributing empty files, create them now, they are filled in later
for i in ${_pkginstalls[@]}
do
        touch $i.install
done
    
source=("https://jdebp.eu/Repository/freebsd/nosh-$pkgver.tar.gz"
        "staging.patch"
        "maintenance-scripts.patch"
        "maintenance.sh"
        "scriptletbuilder.sh"
        "services-dbus.patch"
        "services-at-spi-dbus-bus.patch"
        "services-gconfd.patch"
        
        "nosh-bundles.install"
        "nosh-run-klog.install"
        "nosh-run-user-vt.install"
        "nosh-run-local-syslog.install"
        "nosh-run-via-systemd.install"
        "nosh-run-busybox-mdev.install"
        "nosh-run-openssh-server.install"
        "nosh-run-via-systemd.install"
        "nosh-run-freedesktop-kits.install"
        "nosh-run-suckless-mdev.install"
        "nosh-run-freedesktop-system-bus.install"
        "nosh-run-system-manager.install"
        "nosh-run-virtualbox-guest.install"
        "nosh-run-kernel-vt.install"
        "nosh-run-udev.install"
        "nosh-run-systemd-udev.install"
        "nosh-run-debian-server-base.install"
        "nosh-run-debian-desktop-base.install"
        "nosh-run-openssh-server.install"
        )
noextract=()
sha256sums=(
            '43661c987ec6b843c7da1a496326bb0e213fab02e73f39417522f02d982807c5' # nosh-1.36.tar.gz
            'aef5795fe6aa178627d1272757986e78e03bba5689eef49baa62edd2a55ae25d' # staging.patch
            'e5e90eea4ed0685eccbb6f5435c55100b4ffa53062068d202b0cb96c521c221a' # maintenance-scripts.patch
            '766ae08d97b2d840761132d164bd6bc596c4157470e9ce8b8a6135ea95624ed4' # maintenance.sh
            '2f3a9ee93505534f2db82d71edb694b1c32aa3f4e2880f3d62589a5fe65f062b' # scriptletbuilder.sh
            '30d35b60639a742c27794bf598ceb1b668226dcffe2b418ab7d09e9feabea114' # services-dbus.patch
            'e734440761a14c34ccbaad30d9d3770de074ed12c031d2058de674a29986a173' # services-at-spi-dbus-bus.patch
            '255929ffe55de8264ad865f07e37e86c73eed9dd66cad6ea5ecd5bd4271dac0a' # services-gconfd.patch

            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            )
validpgpkeys=()

prepare() {
    
    # ncurses headers different to Debian layout, patch out the ncursesw directory in cpp Includes
    # taken from https://github.com/atweiden/pkgbuilds/blob/master/nosh/PKGBUILD
	msg2 "Fix ncurses header import issues"
    cd "${srcdir}"/source
    find . -type f -print0 | xargs -0 sed -i 's@ncursesw/curses\.h@curses.h@g'
    
    # patch package/stage for Archlinux filesystem layout
    msg2 "Align staging with Arch FS hierarchy guidelines"
    cd "${srcdir}"
    patch -p1 -i "${srcdir}"/staging.patch
    
    # patch debian maintenance scripts
    msg2 "Adapting maintenance scripts"
    cd "${srcdir}"/package/debian
    sed -i 's@usr/local/lib@usr/lib@g' nosh-run-via-systemd.postinst.extra
    cd "${srcdir}"
    patch -p1 -i "${srcdir}"/maintenance-scripts.patch
    
    # rename debian maintenance scripts to Archlinux nomenclature
    msg2 "Renaming maintenance scripts"
    cd "${srcdir}"/package/debian
    source "${srcdir}"/maintenance.sh

    msg2 "Modifying service files"
    cd "${srcdir}"
    patch -p1 -i "${srcdir}"/services-dbus.patch
    patch -p1 -i "${srcdir}"/services-at-spi-dbus-bus.patch
    patch -p1 -i "${srcdir}"/services-gconfd.patch
}

build() {
	  
    msg2 "Building main source"
    "${srcdir}"/package/compile
    
    msg2 "Generating .install files"
    source "${srcdir}"/scriptletbuilder.sh
    for i in ${_pkginstalls[@]}
    do
        echo "Bulding $i.install"
        _buildinstall $i > $i.install
    done
    
    msg2 "Staging packages"
    # stage packages to 'staging' directory
    "${srcdir}"/package/stage "${srcdir}" "${srcdir}"/staging
}

check() {
    # no test available for the moment
    msg "Checking skipped..."
}

package_nosh-common() {
    
    # provide license (can't be done in each package, it creates file conflicts on install)
    install -Dm 644 "${srcdir}"/source/COPYING "${pkgdir}"/usr/share/licenses/nosh/COPYING

}

# refactor the packaging, need special case for non-conforming package
for _pkg in ${pkgname[@]}
do
    if test "$_pkg" != "nosh-common"
    then
    eval "package_${_pkg}() { _package $_pkg; }"
    fi
done

_package() {

    case "$1" in
        nosh-zsh-completion)
            pkgdesc="Z Shell completion functions for the nosh toolset"
            depends+=( 'nosh-common')
            optdepends=( 'zsh: for actual ZSH support' )
            ;;
        nosh-guide)
            pkgdesc="User guide for the various nosh-* packages"
            depends+=( 'nosh-common')
            ;;
        nosh-exec)
            pkgdesc="Minimal non-shell script processor and various chain-load utilities useful for services"
            depends+=( 'nosh-common')
            conflicts+=( 'daemontools' 'daemontools-encore' 'nosh-bundles<=1.33')
            ;;
        nosh-execline-shims)
            pkgdesc="Execline utility shims"
            depends+=( 'nosh-common' 'nosh-exec')
            conflicts+=( 'execline' )
            ;;
        nosh-core-shims)
            pkgdesc="Core utility shims"
            depends+=( 'nosh-common' 'nosh-exec')
            conflicts+=( 'coreutils' 'util-linux' )
            ;;
        nosh-service-management)
            pkgdesc="Service and system management utilities"
            depends+=( 'nosh-common' 'glibc>=2.13')
            conflicts+=( 'nosh-bundles<=1.30' 'daemontools' 'daemontools-encore' )
            ;;
        nosh-terminal-management)
            pkgdesc="Virtual terminal, pseudo-terminal, and TUI login tools"
            depends+=( 'nosh-common' 'nosh-service-management>=1.14' )
            conflicts+=( 'nosh-bundles<=1.20')
            ;;
        nosh-run-system-manager)
            pkgdesc="Run the nosh system manager"
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'nosh-exec' 'nosh-bundles' 'redo-jdebp')
            conflicts+=( 'nosh-run-via-systemd' 'upstart' 'sysvinit' 'systemd-sysvcompat') #'systemd' 
            install="nosh-run-system-manager.install"
            ;;
        nosh-ucspi-tcp-shims)
            pkgdesc="Bernstein UCSPI-TCP shim service utilities"
            depends+=( 'nosh-common' 'nosh-exec' )
            conflicts+=( 'ucspi-tcp' 'nosh-exec<=1.32')
            ;;
        nosh-terminal-extras)
            pkgdesc="Extra terminal utilities"
            depends+=( 'nosh-common' 'nosh-terminal-management' )
            ;;
        nosh-systemd-shims)
            pkgdesc="Systemd shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            conflicts+=( 'systemd' )
            ;;
        nosh-systemv-shims)
            pkgdesc="BSD and System 5 shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            conflicts+=( 'systemd-sysvcompat')
            ;;
        nosh-upstart-shims)
            pkgdesc="Upstart shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            ;;
        nosh-debian-shims)
            pkgdesc="Debian shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            conflicts+=( 'nosh-run-via-systemd' 'upstart' 'sysvinit' 'systemd' )
            ;;
        nosh-openbsd-shims)
            pkgdesc="OpenBSD shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' 'nosh-systemv-shims<=1.28' )
            conflicts+=( 'nosh-systemv-shims<=1.27')
            ;;
        nosh-freebsd-shims)
            pkgdesc="FreeBSD shim service and system management utilities"
            depends+=( 'nosh-terminal-management' )
            conflicts+=( 'nosh-sistemv-shims<=1.27' )
            ;;
        nosh-bsd-shims)
            pkgdesc="BSD shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            conflicts+=( 'android-tools' )
            ;;
        nosh-kbd-shims)
            pkgdesc="shim kbd utilities"
            depends+=( 'nosh-common' 'nosh-terminal-management' )
            conflicts+=( 'kbd')
            ;;
        nosh-bundles)
            pkgdesc="Service bundles"
            depends+=( 'nosh-common' 'nosh-service-management>=1.34' 'nosh-exec>=1.34' 'nosh-terminal-management>=1.22' 'shadow' )
            install="nosh-bundles.install"
            ;;
        nosh-run-via-systemd)
            pkgdesc="Run the nosh service manager and daemontools service scanner via systemd"
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'systemd' 'nosh-bundles' )
            install="nosh-run-via-systemd.install"
            backup=( 'usr/share/system-control/presets/80-disable-sysinit.preset'
                     'usr/share/system-control/presets/80-disable-dbus.preset'
                     'usr/share/system-control/presets/80-disable-local-syslog.preset'
                     'usr/share/system-control/presets/80-disable-remote-fs.preset'
                     'usr/share/system-control/presets/80-disable-networking.preset'
                     'usr/lib/systemd/system/service-manager-svscan.path'
                     'usr/lib/systemd/system/system-control-normal.service'
                     'usr/lib/systemd/system/service-manager.socket'
                     'usr/lib/systemd/system/service-manager-svscan.service'
                     'usr/lib/systemd/system/vc-getty@.service'
                     'usr/lib/systemd/system/service-manager.service'
                     'usr/lib/tmpfiles.d/terminal-emulator.conf'
                     'usr/lib/tmpfiles.d/service-manager.conf'
                     'usr/lib/tmpfiles.d/system-manager.conf'
                     )
            ;;
        nosh-run-kernel-vt)
            pkgdesc="Run old-style kernel virtual terminals"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-terminal-management' 'nosh-bundles' )
            install="nosh-run-kernel-vt.install"
            backup=( 'usr/share/system-control/presets/80-linux-ttylogin-tty.preset'
                     'usr/share/system-control/presets/80-enable-kernel-vt.preset'
                     )
            ;;
        nosh-run-udev)
            pkgdesc="Run udev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            optdepends+=( 'eudev: alternative udev implementation' )
            conflicts+=('nosh-run-busybox-mdev' 'nosh-run-suckless-mdev' 'nosh-run-vdev' 'nosh-run-systemd-udev')
            install="nosh-run-udev.install"
            backup=( 'usr/share/system-control/presets/80-enable-udev.preset' )
            ;;
        nosh-run-systemd-udev)
            pkgdesc="Run systemd-udev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles>=1.34' 'systemd')
            conflicts+=('nosh-run-busybox-mdev' 'nosh-run-suckless-mdev' 'nosh-run-vdev' 'nosh-run-udev')
            install="nosh-run-systemd-udev.install"
            backup=( 'usr/share/system-control/presets/80-enable-systemd-udev.preset' )
            ;;
        nosh-run-busybox-mdev)
            pkgdesc="Run BusyBox mdev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' 'busybox')
            conflicts+=('nosh-run-udev' 'nosh-run-suckless-mdev' 'nosh-run-vdev' 'nosh-run-systemd-udev')
            install="nosh-run-busybox-mdev.install"
            backup=( 'usr/share/system-control/presets/80-enable-busybox-mdev.preset' )
            ;;
        nosh-run-suckless-mdev)
            pkgdesc="Run SuckLess mdev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' 'smdev')
            conflicts+=('nosh-run-udev' 'nosh-run-busybox-mdev' 'nosh-run-vdev' 'nosh-run-systemd-udev')
            install="nosh-run-suckless-mdev.install"
            backup=( 'usr/share/system-control/presets/80-enable-suckless-mdev.preset' )
            ;;
        nosh-run-vdev)
            pkgdesc="Run vdev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management' 'nosh-bundles' 'vdev-git')
            conflicts+=('nosh-run-busybox-mdev' 'nosh-run-suckless-mdev' 'nosh-run-udev' 'nosh-run-systemd-udev')
            # no run script so far
            # install="nosh-run-vdev.install"
            backup=( 'usr/share/system-control/presets/80-enable-vdev.preset' )
            ;;
        nosh-run-user-vt)
            pkgdesc="Run new-style application-mode virtual terminals"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-terminal-management' 'nosh-bundles' )
            install="nosh-run-user-vt.install"
            backup=( 'usr/share/system-control/presets/80-enable-user-vt.preset'
                     'usr/share/system-control/presets/80-linux-ttylogin-vc.preset'
                     )
            ;;
        nosh-run-freedesktop-system-bus)
            pkgdesc="Run the system-wide message bus from freedesktop.org"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-freedesktop-system-bus.install"
            backup=('usr/share/system-control/presets/80-enable-freedesktop-system-bus.preset' )
            ;;
        nosh-run-freedesktop-kits)
            pkgdesc="Run the various "kit" programs from freedesktop.org"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-freedesktop-kits.install"
            backup=( 'usr/share/system-control/presets/40-PackageKit.preset'
                     'usr/share/system-control/presets/40-PolicyKit.preset'
                     'usr/share/system-control/presets/40-UPower.preset'
                     'usr/share/system-control/presets/40-ColourManager.preset'
                     'usr/share/system-control/presets/40-ConsoleKit.preset'
                     'usr/share/system-control/presets/40-UDisks.preset'
                     'usr/share/system-control/presets/40-NetworkManager.preset'
                     'usr/share/system-control/presets/40-ModemManager.preset'
                     'usr/share/system-control/presets/40-Avahi.preset'
                     )
            ;;
        nosh-run-virtualbox-guest)
            pkgdesc="Run VirtualBox guest additions"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-virtualbox-guest.install"
            backup=( 'usr/share/system-control/presets/80-virtualbox-guest.preset' )
            ;;
        nosh-run-klog)
            pkgdesc="Run the klog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            #conflicts+=( 'systemd' )
            install="nosh-run-klog.install"
            backup=( 'usr/share/system-control/presets/80-enable-klog.preset' )
            ;;
        nosh-run-local-syslog)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            #conflicts+=( 'systemd' )
            install="nosh-run-local-syslog.install"
            backup=( 'usr/share/system-control/presets/80-enable-local-syslog.preset' )
            ;;
        nosh-run-debian-server-base)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles>=1.33' 'nosh-terminal-management' )
            conflicts+=( 'nosh-run-debian-desktop-base' 'nosh-bundles<=1.32')
            install="nosh-run-debian-server-base.install"
            backup=( 'usr/share/system-control/presets/90-linux-static-networking.preset'
                     'usr/share/system-control/presets/50-Debian-Server-Basic.preset'
                     'usr/share/system-control/presets/90-linux-boot-essentials.preset'
                     'usr/share/system-control/presets/90-common-boot-essentials.preset'
                     )
            ;;  
        nosh-run-debian-desktop-base)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles>=1.33' 'nosh-terminal-management' )
            conflicts+=( 'nosh-run-debian-server-base' 'nosh-bundles<=1.32')
            install="nosh-run-debian-desktop-base.install"
            backup=( 'usr/share/system-control/presets/90-linux-static-networking.preset'
                     'usr/share/system-control/presets/50-Debian-Server-Basic.preset'
                     'usr/share/system-control/presets/50-Debian-Desktop-Basic.preset'
                     'usr/share/system-control/presets/90-linux-boot-essentials.preset'
                     'usr/share/system-control/presets/90-common-boot-essentials.preset'
                     )
            ;;  
        nosh-run-openssh-server)
            pkgdesc="Run the OpenSSH server"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-openssh-server.install"
            backup=( 'usr/share/system-control/presets/40-OpenSSHServer.preset' )
            ;;  
    esac
    
    # copy over the staging files
    (cd "${srcdir}"/staging/"${1}"/ && pax -r -w -l -- * "${pkgdir}"/)
    
}
