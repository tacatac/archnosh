#!/bin/sh -e
# builds the Archlinux .install script for a package, argument $1 is the package name
# if a <package>.p file exists, use the corresponding utility .funcs
# if a <package>.(pre_|post_)(install|upgrade|remove).extra exists, add it or use it standalone

_buildinstall() {
    
    local pkgpath="${srcdir}"/package/debian
    
    for j in install upgrade remove
    do
        for k in pre_ post_
        do
            s="$k$j"
            if test -r $pkgpath/"$1".p # bundle-based install
            then
                printf "$s() {\n"
                if >/dev/null expr "$1" : "nosh-run-"
                then
                    printf "    nosh_run_package=YES\n"
                fi
                sed -e 's/^/    /' $pkgpath/"$s".funcs # all combinations are present
                echo
                sed -e 's/^/    /' $pkgpath/"$1".p
                if test -r $pkgpath/"$1"."$s".extra # additional instructions
                then
                    sed -e 's/^/    /' $pkgpath/"$1"."$s".extra
                fi
                printf "\n}\n"
            else # no bundle, only extra scripting
                if test -r $pkgpath/"$1"."$s".extra
                then
                    printf "$s() {\n"
                    sed -e 's/^/    /' $pkgpath/"$1"."$s".extra
                    printf "\n}\n"
                fi
            fi
        done
    done
    
}
