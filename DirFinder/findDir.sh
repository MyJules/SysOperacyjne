#!/usr/bin/bash

number=2
archiveName='defArchive'
fileName='defFile'

#read input
while getopts "n:m:a:" OPTION
do
case $OPTION in
    n)
        number=$OPTARG
        ;;
    m)
        archiveName=$OPTARG
        ;;
    a)
        fileName=$OPTARG
        ;;
    *)
        echo "No option!!!";
        exit 1
        ;;
esac
done

#debuglog
echo $number
echo "$archiveName"
echo "$fileName"

#find
