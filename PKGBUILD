# Maintainer:  taca <taca@kadisius.eu>

pkgbase=nosh
pkgname=(
    'nosh-common'
    'nosh-guide'
    'nosh-exec'
    'nosh-service-management'
    'nosh-terminal-management'
    'nosh-terminal-extras'
    'nosh-zsh-completion'
    'nosh-systemv-shims'
    'nosh-systemd-shims'
    'nosh-upstart-shims'
    'nosh-execline-shims'
    'nosh-core-shims'
    'nosh-service-command-shim'
    'nosh-debian-shims'
    'nosh-openbsd-shims'
    'nosh-freebsd-shims'
    'nosh-bsd-shims'
    'nosh-ucspi-tcp-shims'
    'nosh-kbd-shims'
     #'nosh-logrotate-shims'
    'nosh-bundles'
    'nosh-run-system-manager'
    'nosh-run-debian-desktop-base'
    'nosh-run-debian-server-base'
    'nosh-run-kernel-vt'
    'nosh-run-user-vt'
    'nosh-run-via-systemd'
    'nosh-run-virtualbox-guest'
    'nosh-run-freedesktop-system-bus'
    'nosh-run-freedesktop-kits'
    'nosh-run-openssh-server'
    'nosh-run-appletalk'
    'nosh-run-udev'
    'nosh-run-systemd-udev'
    'nosh-run-busybox-mdev'
    'nosh-run-suckless-mdev'
    'nosh-run-vdev'
    'nosh-run-local-syslog'
    'nosh-run-klog'
    )               
pkgver=1.37
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
        "nosh-run-busybox-mdev"
        "nosh-run-debian-desktop-base"
        "nosh-run-debian-server-base"
        "nosh-run-freedesktop-kits"
        "nosh-run-freedesktop-system-bus"
        "nosh-run-kernel-vt"
        "nosh-run-klog"
        "nosh-run-local-syslog"
        "nosh-run-openssh-server"
        "nosh-run-suckless-mdev"
        "nosh-run-systemd-udev"
        "nosh-run-system-manager"
        "nosh-run-udev"
        "nosh-run-user-vt"
        "nosh-run-via-systemd"
        "nosh-run-virtualbox-guest"
        "nosh-service-management"
        )
        
# no point in distributing empty files, create them now, they are filled in later
for i in ${_pkginstalls[@]}
do
        touch $i.install
done
    
source=("https://jdebp.eu/Repository/freebsd/nosh-$pkgver.tar.gz"
        "staging.patch"
        "maintenance-scripts.patch"
        "scriptletbuilder.sh"
        "misc.patch"
        "os_version.do"
        "gnome-maps.service.linux"
        "gnome-weather-application.service.linux"
        "watchman.service"
        "watchman.socket"
        "uscheduled.service"
        "uscheduled.socket"
        
        "nosh-bundles.install"
        "nosh-run-busybox-mdev.install"
        "nosh-run-debian-desktop-base.install"
        "nosh-run-debian-server-base.install"
        "nosh-run-freedesktop-kits.install"
        "nosh-run-freedesktop-system-bus.install"
        "nosh-run-kernel-vt.install"
        "nosh-run-klog.install"
        "nosh-run-local-syslog.install"
        "nosh-run-openssh-server.install"
        "nosh-run-suckless-mdev.install"
        "nosh-run-systemd-udev.install"
        "nosh-run-system-manager.install"
        "nosh-run-udev.install"
        "nosh-run-user-vt.install"
        "nosh-run-via-systemd.install"
        "nosh-run-virtualbox-guest.install"
        "nosh-service-management.install"
        )
noextract=()
sha256sums=(
            'a8bfe55b9f3e61097c1dfaa23c8d5ea0c39e1dc1ddf0b669133c1d7723911c93' # nosh-1.37.tar.gz
            'e7fc3022780a179a0da293b0da4094deef770cb6f4572b39c6bec4e38752f0d5' # staging.patch
            '8f2a1ba80ac5a6a912579a70454bc843d551db22bd1ef7e6dda9124167a7fa00' # maintenance-scripts.patch
            '907d92546845ab087be38515fcbd04bec68b68a250534063695e73646241454c' # scriptletbuilder.sh
            'fd07dd551ad82a813bcd50d91f0395e26dbae93e36f76ac21c2439683ab777a6' # misc.patch
            '156a4251a0acb56ff999a543563c91a6268294da92e45c030bbad8719d9b425b' # os_version.do
            '12e480b923b4828dc30907fa0e4deffbf68d1eff2da672fb7933f0bf5a829c93' # gnome-maps.service.linux
            '65a81acca6504d4bf0843b59d7f70228499f84d79e13d68968eacdba7b9e60f8' # gnome-weather-application.service.linux
            'ed18d04556bdf208a4a69ff866d49bdf65129639b32f15a4aab5193477bb8f37' # watchman.service
            '944e8a7a4662ce8e3ebccf64db792407e0ac5e16fb91324513e37bc042c7d56f' # watchman.socket
            '37fcde3d74c70e92ee7b606fd50cdffbd45a70a7348745cf5756b762b3602aab' # uscheduled.service
            'bda8c7717fd71ee49c8d99e0fc0c595068d7e9bc7dc9aa9dda9d2840e9ef04cb' # uscheduled.socket
            
            'SKIP' # nosh-bundles.install
            'SKIP' # nosh-run-busybox-mdev.install
            'SKIP' # nosh-run-debian-desktop-base.install
            'SKIP' # nosh-run-debian-server-base.install
            'SKIP' # nosh-run-freedesktop-kits.install
            'SKIP' # nosh-run-freedesktop-system-bus.install
            'SKIP' # nosh-run-kernel-vt.install
            'SKIP' # nosh-run-klog.install
            'SKIP' # nosh-run-local-syslog.install
            'SKIP' # nosh-run-openssh-server.install
            'SKIP' # nosh-run-suckless-mdev.install
            'SKIP' # nosh-run-systemd-udev.install
            'SKIP' # nosh-run-system-manager.install
            'SKIP' # nosh-run-udev.install
            'SKIP' # nosh-run-user-vt.install
            'SKIP' # nosh-run-via-systemd.install
            'SKIP' # nosh-run-virtualbox-guest.install
            'SKIP' # nosh-service-management.install
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
    sed -i 's@usr/local/lib@usr/lib@g' nosh-run-via-systemd.post_install.extra nosh-run-via-systemd.post_upgrade.extra
    cd "${srcdir}"
    patch -p1 -i "${srcdir}"/maintenance-scripts.patch
    patch -p1 -i "${srcdir}"/misc.patch

    # add 1.38 backported os_version, needed at build time
    install -v -m 755 "${srcdir}"/os_version.do "${srcdir}"/source/
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
        nosh-guide)
            pkgdesc="User guide for the various nosh-* packages"
            depends+=( 'nosh-common')
            ;;
        nosh-exec)
            pkgdesc="Minimal non-shell script processor and various chain-load utilities useful for services"
            depends+=( 'nosh-common')
            conflicts+=( 'daemontools' 'daemontools-encore' 'nosh-bundles<=1.33')
            ;;
        nosh-service-management)
            pkgdesc="Service and system management utilities"
            depends+=( 'nosh-common' 'glibc>=2.13')
            conflicts+=( 'nosh-bundles<=1.30' 'daemontools' 'daemontools-encore' )
            install="nosh-service-management.install"
            ;;
        nosh-terminal-management)
            pkgdesc="Virtual terminal, pseudo-terminal, and TUI login tools"
            depends+=( 'nosh-common' 'nosh-service-management>=1.14' )
            conflicts+=( 'nosh-bundles<=1.20')
            ;;
        nosh-terminal-extras)
            pkgdesc="Extra terminal utilities"
            depends+=( 'nosh-common' 'nosh-terminal-management' )
            ;;
        nosh-zsh-completion)
            pkgdesc="Z Shell completion functions for the nosh toolset"
            depends+=( 'nosh-common')
            optdepends=( 'zsh: for actual ZSH support' )
            ;;
        nosh-systemv-shims)
            pkgdesc="BSD and System 5 shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            conflicts+=( 'systemd-sysvcompat')
            ;;
        nosh-systemd-shims)
            pkgdesc="Systemd shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            conflicts+=( 'systemd' )
            ;;
        nosh-upstart-shims)
            pkgdesc="Upstart shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            ;;
        nosh-execline-shims)
            pkgdesc="Execline utility shims"
            depends+=( 'nosh-common' 'nosh-exec' )
            conflicts+=( 'execline' )
            ;;
        nosh-core-shims)
            pkgdesc="Core utility shims"
            depends+=( 'nosh-common' 'nosh-exec' )
            conflicts+=( 'coreutils' 'util-linux' )
            ;;
        nosh-service-command-shim)
            pkgdesc="Shim for the old BSD and System 5 service command"
            depends+=( 'nosh-common' 'nosh-service-management' 'nosh-systemv-shims' )
            conflicts+=( 'systemd-sysvcompat' 'sysvinit' 'nosh-systemv-shims<=1.36')
            ;;
        nosh-debian-shims)
            pkgdesc="Debian shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' )
            conflicts+=( 'nosh-run-via-systemd' 'upstart' 'sysvinit' 'systemd' )
            ;;
        nosh-openbsd-shims)
            pkgdesc="OpenBSD shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' 'nosh-systemv-shims>=1.28' )
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
        nosh-ucspi-tcp-shims)
            pkgdesc="Bernstein UCSPI-TCP shim service utilities"
            depends+=( 'nosh-common' 'nosh-exec' )
            conflicts+=( 'ucspi-tcp' 'nosh-exec<=1.32')
            ;;
        nosh-kbd-shims)
            pkgdesc="Shim kbd utilities"
            depends+=( 'nosh-common' 'nosh-terminal-management' )
            conflicts+=( 'kbd')
            ;;
        #nosh-logrotate-shims)
        #    pkgdesc="Shim for the logrotate package"
        #    depends+=( 'nosh-common' 'nosh-bundles' )
        #    ;;
        nosh-bundles)
            pkgdesc="Service bundles"
            depends+=( 'nosh-common' 'nosh-service-management>=1.37' 'nosh-exec>=1.37' 'nosh-terminal-management>=1.22' 'shadow' )
            install="nosh-bundles.install"
            install -D -v -m 444 "${srcdir}"/gnome-maps.service.linux "${pkgdir}"/etc/system-control/convert/per-user/gnome-maps.service
            install -v -m 444 "${srcdir}"/gnome-weather-application.service.linux "${pkgdir}"/etc/system-control/convert/per-user/gnome-weather-application.service
            install -v -m 444 "${srcdir}"/watchman.service "${pkgdir}"/etc/system-control/convert/per-user/
            install -v -m 444 "${srcdir}"/watchman.socket "${pkgdir}"/etc/system-control/convert/per-user/
            install -v -m 444 "${srcdir}"/uscheduled.service "${pkgdir}"/etc/system-control/convert/per-user/
            install -v -m 444 "${srcdir}"/uscheduled.socket "${pkgdir}"/etc/system-control/convert/per-user/
            ;;
        nosh-run-system-manager)
            pkgdesc="Run the nosh system manager"
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'nosh-exec' 'nosh-bundles' 'redo-jdebp' )
            conflicts+=( 'nosh-run-via-systemd' 'upstart' 'sysvinit' 'systemd-sysvcompat') #'systemd' 
            install="nosh-run-system-manager.install"
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
        nosh-run-kernel-vt)
            pkgdesc="Run old-style kernel virtual terminals"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-terminal-management' 'nosh-bundles' )
            install="nosh-run-kernel-vt.install"
            backup=( 'usr/share/system-control/presets/80-linux-ttylogin-tty.preset'
                     'usr/share/system-control/presets/80-enable-kernel-vt.preset'
                     )
            ;;
        nosh-run-user-vt)
            pkgdesc="Run new-style application-mode virtual terminals"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-terminal-management' 'nosh-bundles' )
            install="nosh-run-user-vt.install"
            backup=( 'usr/share/system-control/presets/80-enable-user-vt.preset'
                     'usr/share/system-control/presets/80-linux-ttylogin-vc.preset'
                     )
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
        nosh-run-virtualbox-guest)
            pkgdesc="Run VirtualBox guest additions"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-virtualbox-guest.install"
            backup=( 'usr/share/system-control/presets/80-virtualbox-guest.preset' )
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
        nosh-run-openssh-server)
            pkgdesc="Run the OpenSSH server"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-openssh-server.install"
            backup=( 'usr/share/system-control/presets/40-OpenSSHServer.preset' )
            ;;
        nosh-run-appletalk)
            pkgdesc="Run the various AppleTalk service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            backup=( 'usr/share/system-control/presets/40-AppleTalk.preset' )
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
        nosh-run-local-syslog)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            #conflicts+=( 'systemd' )
            install="nosh-run-local-syslog.install"
            backup=( 'usr/share/system-control/presets/80-enable-local-syslog.preset' )
            ;;
        nosh-run-klog)
            pkgdesc="Run the klog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            #conflicts+=( 'systemd' )
            install="nosh-run-klog.install"
            backup=( 'usr/share/system-control/presets/80-enable-klog.preset' )
            ;;
    esac
    
    # copy over the staging files
    (cd "${srcdir}"/staging/"${1}"/ && pax -r -w -l -- * "${pkgdir}"/)
    
}
