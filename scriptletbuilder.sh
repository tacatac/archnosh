#!/bin/sh -e
# builds the Archlinux .install script for a package
# if a <package>.(pre_|post_)(install|upgrade|remove) file exists, use it directly
# if a <package>.p file exists, use the corresponding utility .funcs
# adding the <package>.(pre_|post_)(install|upgrade|remove).extra if they exist

_buildinstall() {
    
    local pkgpath="${srcdir}"/package/debian
    
    for j in install upgrade remove
    do
        for k in pre_ post_
        do
            s="$k$j"
            if test -r $pkgpath/"$1"."$s" # specific install script
            then
                echo "$s() {"
                echo
                sed -e 's/^/    /' $pkgpath/"$1"."$s"
                echo
                echo "}"
                echo
            elif test -r $pkgpath/"$1".p # bundle-based install
            then
                if test -r $pkgpath/"$s".funcs
                then
                    echo "$s() {"
                    echo
                    if >/dev/null expr "$1" : "nosh-run-"
                    then
                        echo "    nosh_run_package=YES"
                        echo
                    fi
                    sed -e 's/^/    /' $pkgpath/"$s".funcs
                    echo
                    if test -r $pkgpath/"$1"."$s".extra # additional instructions
                    then
                        sed -e 's/^/    /' $pkgpath/"$1"."$s".extra
                    fi
                    echo
                    sed -e 's/^/    /' $pkgpath/"$1".p
                    echo
                    echo "}"
                    echo
                fi
            fi
        done
    done
    
}
