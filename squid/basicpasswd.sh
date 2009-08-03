#!/bin/sh

outfile=$1
user=$2
pass=$3

if [ -z "$1" -o -z "$2" -o -z "$3" ] ; then
        echo "Usage: $0 outfile user password"
        exit 1
fi

htpasswd -bc $outfile $user $pass

