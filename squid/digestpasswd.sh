#!/bin/sh
 
user=$1
realm=$2
pass=$3

if [ -z "$1" -o -z "$2" -o -z "$3" ] ; then
        echo "Usage: $0 user realm password"
        exit 1
fi
 
ha1=`echo -n "$user:$realm:$pass" | md5sum | cut -f1 -d' '`
echo "$user:$realm:$ha1"

