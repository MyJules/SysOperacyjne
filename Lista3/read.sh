#! /usr/bin/env bash
pipe=FIFO

ctrlc_count=0

function no_ctrlc()
{
    let ctrlc_count++
    echo
    if [[ $ctrlc_count == 2 ]]; then
        exit
    fi
}
trap no_ctrlc SIGINT

while true
do
    cat $pipe
done
