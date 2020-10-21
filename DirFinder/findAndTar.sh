#!/usr/bin/bash

number=7
archiveName='defArchive.tar'
fileName='*.cpp'

isFileNameRead=false
isArchiveNameRead=false
isNumberRead=false

#read input
while getopts "n:m:a:" OPTION
do
case $OPTION in
    n)
        isNumberRead=true;
        number=$OPTARG
        ;;
    a)
        isArchiveNameRead=true;
        archiveName=$OPTARG
        ;;
    m)
        isFileNameRead=true;
        fileName=$OPTARG
        ;;
    *)
        echo "No option!!!";
        exit 1
        ;;
esac
done

#czytamy environment value jezeli nie byly podane 
#w parametrach
if  $isNumberRead ; then
    echo ""
else

    if [[ -z "${F_DATE}" ]]; then
        echo "Date name have default value..."
    else
        number=$F_DATE
    fi
fi

if  $isFileNameRead ; then
    echo ""
else

    if [[ -z "${F_FILE_NAME}" ]]; then
        echo "File name have default value..."
    else
        fileName=$F_FILE_NAME
    fi
fi

if  $isArchiveNameRead ; then
    echo ""
else

    if [[ -z "${F_ARCHIVE_NAME}" ]]; then
        echo "Archive name have default value..."
    else
        archiveName=$F_ARCHIVE_NAME
    fi

fi

#debuglog
echo $number
echo "$archiveName"
echo "$fileName"

#find + archiwacja
find . -type f -name $fileName -mtime -$number | tar -zcvf $archiveName -T -