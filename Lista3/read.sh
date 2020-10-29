#! /usr/bin/env bash
pipe=FIFO

while :; do
    cat $pipe
done
