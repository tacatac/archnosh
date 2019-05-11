# Maintainer:  taca <taca@kadisius.eu>

pkgbase=nosh
pkgname=(
    'nosh-common'
    'nosh-guide'
    'nosh-exec'
    'nosh-service-management'
    'nosh-service-management-extras'
    'nosh-terminal-management'
    'nosh-terminal-extras'
    'nosh-zsh-completion'
    'nosh-systemv-shims'
    'nosh-systemd-shims'
    'nosh-upstart-shims'
    'nosh-execline-shims'
    'nosh-core-shims'
    'nosh-linux-shims'
    'nosh-service-command-shim'
    'nosh-debian-shims'
    'nosh-openrc-shims'
    'nosh-openbsd-shims'
    'nosh-freebsd-shims'
    'nosh-bsd-shims'
    'nosh-ucspi-tcp-shims'
    'nosh-kbd-shims'
    'nosh-net-tools-shims'
     #'nosh-logrotate-shims'
    'nosh-bcron-as-cron-shims'
    'nosh-desktop-bus-shims'
    'nosh-bundles'
    'nosh-debian-crontab-no-anacron'
    'nosh-debian-crontab-anacron'
    'nosh-run-system-manager'
    'nosh-run-debian-desktop-base'
    'nosh-run-debian-server-base'
    'nosh-run-kernel-vt'
    'nosh-run-user-vt'
    'nosh-run-via-open-rc'
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
    'nosh-run-mdevd'
    'nosh-run-local-syslog'
    'nosh-run-klog'
    'nosh-run-bcron'
    )               
pkgver=1.40
pkgrel=2
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
        "nosh-desktop-bus-shims"
        "nosh-run-bcron"
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
        "nosh-run-via-open-rc"
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
        "README.md"
        
        "nosh-bundles.install"
        "nosh-desktop-bus-shims.install"
        "nosh-run-bcron.install"
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
        "nosh-run-via-open-rc.install"
        "nosh-run-virtualbox-guest.install"
        )
noextract=()
sha256sums=(
            '263982c4ba2889f823f9d4be6ac2daafd1af5b341f9e02f2ed7b28b0788e02c3' # nosh-1.40.tar.gz
            '21f94e9eb2ddb4f3e1590177f62385b30a263fc43281b5d4cace38abb7723bb5' # staging.patch
            '1713514f1e702b1fa663a84108c37d2cd28f70e1eea31e4c4ffb7d5ff940fa03' # maintenance-scripts.patch
            '907d92546845ab087be38515fcbd04bec68b68a250534063695e73646241454c' # scriptletbuilder.sh
            'SKIP' # README.md
            
            'SKIP' # nosh-bundles.install
            'SKIP' # nosh-desktop-bus-shims.install
            'SKIP' # nosh-run-bcron.install
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
            'SKIP' # nosh-run-via-open-rc.install
            'SKIP' # nosh-run-virtualbox-guest.install
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
        nosh-service-management-extras)
            pkgdesc="Extra service and system management utilities"
            depends+=( 'nosh-common' 'glibc>=2.13' )
            conflicts+=( 'nosh-bundles<=1.30' )
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
            #conflicts+=( 'systemd' ) # conflict not set, to allow selective pacman --overwrite
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
            #conflicts+=( 'coreutils' 'util-linux' ) # conflict not set, to allow selective pacman --overwrite
            ;;
        nosh-linux-shims)
            pkgdesc="Linux utility shims"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-terminal-management' )
            #conflicts+=( 'coreutils' 'util-linux' ) # conflict not set, to allow selective pacman --overwrite
            ;;
        nosh-service-command-shim)
            pkgdesc="Shim for the old BSD and System 5 service command"
            depends+=( 'nosh-common' 'nosh-service-management' 'nosh-systemv-shims' )
            conflicts+=( 'systemd-sysvcompat' 'sysvinit' 'nosh-systemv-shims<=1.36')
            ;;
        nosh-debian-shims)
            pkgdesc="Debian shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' 'nosh-service-command-shim' 'nosh-systemv-shims' )
            conflicts+=( 'upstart' 'sysvinit' 'systemd' )
            ;;
        nosh-openrc-shims)
            pkgdesc="OpenRC shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' 'nosh-systemv-shims' )
            conflicts+=( 'openrc' 'upstart' 'sysvinit' 'systemd' )
            ;;
        nosh-openbsd-shims)
            pkgdesc="OpenBSD shim service and system management utilities"
            depends+=( 'nosh-common' 'nosh-service-management' 'nosh-systemv-shims>=1.28' )
            conflicts+=( 'nosh-systemv-shims<=1.27')
            ;;
        nosh-freebsd-shims)
            pkgdesc="FreeBSD shim service and system management utilities"
            depends+=( 'nosh-terminal-management' )
            conflicts+=( 'nosh-systemv-shims<=1.27' )
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
            ;;
        nosh-net-tools-shims)
            pkgdesc="Linux utility shims"
            depends+=( 'nosh-common' 'nosh-exec' )
            ;;
        #nosh-logrotate-shims)
        #    pkgdesc="Shim for the logrotate package"
        #    depends+=( 'nosh-common' 'nosh-bundles' )
        #    ;;
        nosh-bcron-as-cron-shims)
            pkgdesc="Shim for the bcron package"
            depends+=( 'nosh-common' 'bcron' )
            ;;
        nosh-desktop-bus-shims)
            pkgdesc="Replacements for Desktop Bus utilities"
            depends+=( 'nosh-common' 'nosh-exec>=1.38' )
            install="nosh-desktop-bus-shims.install"
            ;;
        nosh-bundles)
            pkgdesc="Service bundles"
            depends+=( 'nosh-common' 'nosh-service-management>=1.39' 'nosh-exec>=1.39' 'nosh-terminal-management>=1.39' 'shadow' )
            install="nosh-bundles.install"
            ;;
        nosh-debian-crontab-no-anacron)
            pkgdesc="Debian common crontab (not-anacron version)"
            depends+=( 'nosh-common' )
            conflicts+=( 'anacron' 'nosh-debian-crontab-anacron' )
            ;;
        nosh-debian-crontab-anacron)
            pkgdesc="Debian common crontab (anacron version)"
            depends+=( 'nosh-common' )
            conflicts+=( 'nosh-debian-crontab-no-anacron' )
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
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-terminal-management' 'nosh-bundles>=1.37' )
            install="nosh-run-user-vt.install"
            backup=( 'usr/share/system-control/presets/80-enable-user-vt.preset'
                     'usr/share/system-control/presets/80-linux-ttylogin-vc.preset'
                     )
            ;;
        nosh-run-via-open-rc)
            pkgdesc="Run the nosh service manager and daemontools service scanner via OpenRC"
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'systemd' 'nosh-bundles>=1.40' )
            ;;
        nosh-run-via-systemd)
            pkgdesc="Run the nosh service manager and daemontools service scanner via systemd"
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'systemd' 'nosh-bundles>=1.40' )
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
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' 'vdev-git')
            conflicts+=('nosh-run-busybox-mdev' 'nosh-run-suckless-mdev' 'nosh-run-udev' 'nosh-run-systemd-udev')
            # no run script so far
            # install="nosh-run-vdev.install"
            backup=( 'usr/share/system-control/presets/80-enable-vdev.preset' )
            ;;
        nosh-run-mdevd)
            pkgdesc="Run Laurent Bercot's mdevd as the device manager"
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'nosh-bundles' )
            ;;
        nosh-run-local-syslog)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            conflicts+=( 'systemd-sysvcompat' )
            install="nosh-run-local-syslog.install"
            backup=( 'usr/share/system-control/presets/80-enable-local-syslog.preset' )
            ;;
        nosh-run-klog)
            pkgdesc="Run the klog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            conflicts+=( 'systemd-sysvcompat' )
            install="nosh-run-klog.install"
            backup=( 'usr/share/system-control/presets/80-enable-klog.preset' )
            ;;
        nosh-run-bcron)
            pkgdesc="Run the bcron services"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' 'bcron' )
            conflicts=( 'bcron-run' )
            provides=( 'bcron-run' )
            ;;
    esac
    
    # copy over the staging files
    (cd "${srcdir}"/staging/"${1}"/ && pax -r -w -l -- * "${pkgdir}"/)
    
}
