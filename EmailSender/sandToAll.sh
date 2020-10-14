#!/usr/bin/bash

#reading emails
while IFS= read -r email; do
    echo "Emails: $email"
    
    tresc=''
    #pobieranie tresci
    while IFS= read -r line; do
        tresc+="$line\n"
    done < tresc.txt 
  
    printf "$tresc"

    mail -s 'Subj' $email <<< $tresc -A spec/spec*.pdf

    echo
    echo "~~~~~~~~~~~~~~~"
    echo

done < adresy.txt