#!/usr/bin/bash

number=7
archiveName='defArchive.tar'
fileName='*.cpp'

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

#find + archiwacja
find /home -type f -name $fileName -mtime -$number | tar -zcvf $archiveName -T -
