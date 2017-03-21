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
    'nosh-kbd-shims'
    'nosh-bundles'
    'nosh-run-via-systemd'
    'nosh-run-kernel-vt'
    'nosh-run-udev'
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
pkgver=1.33
pkgrel=1
pkgdesc="A suite of system-level utilities for initializing and running a BSD or Linux system, for managing daemons, for managing terminals, and for managing logging."
arch=('x86_64')
url="https://jdebp.eu/Softwares/nosh/index.html"
license=('custom:MIT Expat' 'custom:FreeBSD' 'custom:ISC' 'custom:Simplified BSD')
groups=()
depends=()
makedepends=('pax' 'docbook-xml' 'docbook-xsl' 'xmlto' 'libtinfo' 'redo-jdebp')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=""
changelog=""

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
        "nosh-run-udev.post_install.extra"
        
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
        "nosh-run-debian-server-base.install"
        "nosh-run-debian-desktop-base.install"
        "nosh-run-openssh-server.install"
        )
noextract=()
sha256sums=('4d8417de969e708c5d6010804981514479e465e73fb5a20444147ef0bcbbead1'
            '87ad51a0d21fdadf12daa23309559a2599bd3ab5d658582dd73dc54388452251'
            '305fd4cd53b2cad248d0e452bbcc3a858ff22fccd7ecbf9d117eeb1d2a432f6b'
            '2421737983743c871424499a6bc287f4d711b15e4a5ab8632e92ca62ef3a833a'
            'd2ee01d6d41caa8015eb74eb37525de3d45c5bb071c8785fe245884aa19f20ac'
            'f90975c663794c7e87be157e03cdfa9bd835c212200539367e848fbbf9fe6cc9'

            
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
    cd "${srcdir}"/package
    patch -i "${srcdir}"/staging.patch
    
    # patch debian maintenance scripts
    msg2 "Adapting maintenance scripts"
    cd "${srcdir}"/package/debian
    sed -i 's@usr/local/lib@usr/lib@g' nosh-run-via-systemd.postinst.extra
    cd "${srcdir}"
    patch -p1 -i "${srcdir}"/maintenance-scripts.patch
    
    
    msg2 "Adding extra install scripts"
    # copy over the nosh-run-udev install files
    cp -v "${srcdir}"/nosh-run-udev.post_install.extra "${srcdir}"/package/debian/
    
    # rename debian maintenance scripts to Archlinux nomenclature
    msg2 "Renaming maintenance scripts"
    cd "${srcdir}"/package/debian
    source "${srcdir}"/maintenance.sh

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
            depends+=( 'nosh-common')
            conflicts+=( 'nosh-bundles<=1.30')
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
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'nosh-exec>=1.32' 'nosh-terminal-management>=1.22' 'shadow' )
            install="nosh-bundles.install"
            ;;
        nosh-run-via-systemd)
            pkgdesc="Run the nosh service manager and daemontools service scanner via systemd"
            depends+=( 'nosh-common' 'nosh-service-management>=1.33' 'systemd' 'nosh-bundles' )
            install="nosh-run-via-systemd.install"
            ;;
        nosh-run-kernel-vt)
            pkgdesc="Run old-style kernel virtual terminals"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-terminal-management' 'nosh-bundles' )
            install="nosh-run-kernel-vt.install"
            ;;
        nosh-run-udev)
            pkgdesc="Run udev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.16' 'nosh-bundles' 'systemd')
            conflicts+=('nosh-run-busybox-mdev' 'nosh-run-suckless-mdev' 'nosh-run-vdev')
            install="nosh-run-udev.install"
            ;;
        nosh-run-busybox-mdev)
            pkgdesc="Run BusyBox mdev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.16' 'nosh-bundles' 'busybox')
            conflicts+=('nosh-run-udev' 'nosh-run-suckless-mdev' 'nosh-run-vdev')
            install="nosh-run-busybox-mdev.install"
            ;;
        nosh-run-suckless-mdev)
            pkgdesc="Run SuckLess mdev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.16' 'nosh-bundles' 'smdev')
            conflicts+=('nosh-run-udev' 'nosh-run-busybox-mdev' 'nosh-run-vdev')
            install="nosh-run-suckless-mdev.install"
            ;;
        nosh-run-vdev)
            pkgdesc="Run vdev as the device manager"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management' 'nosh-bundles' 'vdev-git')
            conflicts+=('nosh-run-busybox-mdev' 'nosh-run-suckless-mdev' 'nosh-run-udev')
            # no run script so far
            # install="nosh-run-vdev.install"
            ;;
        nosh-run-user-vt)
            pkgdesc="Run new-style application-mode virtual terminals"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-terminal-management' 'nosh-bundles' )
            install="nosh-run-user-vt.install"
            ;;
        nosh-run-freedesktop-system-bus)
            pkgdesc="Run the system-wide message bus from freedesktop.org"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-freedesktop-system-bus.install"
            ;;
        nosh-run-freedesktop-kits)
            pkgdesc="Run the various "kit" programs from freedesktop.org"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-freedesktop-kits.install"
            ;;
        nosh-run-virtualbox-guest)
            pkgdesc="Run VirtualBox guest additions"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-virtualbox-guest.install"
            ;;
        nosh-run-klog)
            pkgdesc="Run the klog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            #conflicts+=( 'systemd' )
            install="nosh-run-klog.install"
            ;;
        nosh-run-local-syslog)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            #conflicts+=( 'systemd' )
            install="nosh-run-local-syslog.install"
            ;;
        nosh-run-debian-server-base)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles>=1.33' 'nosh-terminal-management' )
            conflicts+=( 'nosh-run-desktop-base' 'nosh-bundles<=1.32')
            install="nosh-run-debian-server-base.install"
            ;;  
        nosh-run-debian-desktop-base)
            pkgdesc="Run the local syslog service"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles>=1.33' 'nosh-terminal-management' )
            conflicts+=( 'nosh-run-server-base' 'nosh-bundles<=1.32')
            install="nosh-run-debian-desktop-base.install"
            ;;  
        nosh-run-openssh-server)
            pkgdesc="Run the OpenSSH server"
            depends+=( 'nosh-common' 'nosh-exec' 'nosh-service-management>=1.33' 'nosh-bundles' )
            install="nosh-run-openssh-server.install"
            ;;  
    esac
    
    # copy over the staging files
    (cd "${srcdir}"/staging/"${1}"/ && pax -r -w -l -- * "${pkgdir}"/)
    
}
