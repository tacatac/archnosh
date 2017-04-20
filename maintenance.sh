#!/bin/sh -e 
# rename files in package/debian/ to work with the scriptlet builder
# i.e. Archlinux nomenclature for .install

# functions to apply for service bundles in *.p files
mv -v preinst.funcs pre_upgrade.funcs
mv -v postinst.funcs post_install.funcs
mv -v prerm.funcs pre_remove.funcs
mv -v postrm.funcs post_upgrade.funcs

# specific maintenance
mv -v nosh-bundles.postinst.extra nosh-bundles.post_install.extra
mv -v nosh-bundles.postrm.extra nosh-bundles.post_upgrade.extra
mv -v nosh-bundles.preinst.extra nosh-bundles.pre_upgrade.extra
mv -v nosh-bundles.prerm.extra nosh-bundles.pre_remove.extra

# runs external format import conversions on install and upgrades
mv -v nosh-run-system-manager.postinst nosh-run-system-manager.post_install
cp -v nosh-run-system-manager.post_install nosh-run-system-manager.post_upgrade

mv -v nosh-run-via-systemd.postinst.extra nosh-run-via-systemd.post_install
mv -v nosh-run-via-systemd.prerm.extra nosh-run-via-systemd.pre_remove
# was removed
# mv -v nosh-run-via-systemd.postrm.extra nosh-run-via-systemd.post_upgrade
mv -v nosh-run-via-systemd.postrm nosh-run-via-systemd.post_remove
