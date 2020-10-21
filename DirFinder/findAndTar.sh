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
    echo "Number was readed"
else
    echo "!Nuber was not readed"

    if [[ -z "${F_DATE}" ]]; then
        echo "Undefind"
    else
        echo "Defined"
        number = F_DATE
    fi
fi

if  $isFileNameRead ; then
    echo "File Name was readed"
else
    echo "!File Name was not readed"

    if [[ -z "${F_FILE_NAME}" ]]; then
        echo "Undefind"
    else
        echo "Defined"
        fileName=$F_FILE_NAME
    fi
fi

if  $isArchiveNameRead ; then
    echo "Archive Name was readed"
else
    echo "!Archive Name was not readed"

    if [[ -z "${F_ARCHIVE_NAME}" ]]; then
        echo "Undefind"
    else
        echo "Defined"
        archiveName=$F_ARCHIVE_NAME
    fi

fi

#debuglog
echo $number
echo "$archiveName"
echo "$fileName"

#find + archiwacja
find . -type f -name $fileName -mtime -$number | tar -zcvf $archiveName -T -