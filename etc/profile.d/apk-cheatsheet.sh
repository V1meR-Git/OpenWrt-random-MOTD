if [ -x /usr/bin/apk ] ; then
    dir="/root/banners"
    if [ -d "$dir" ]; then
        set -- "$dir"/*
        if [ -e "$1" ]; then
            count=$#
            idx=$(( (RANDOM % count) + 1 ))
            eval file=\${$idx}
            cat "$file"
        fi
    fi
fi
