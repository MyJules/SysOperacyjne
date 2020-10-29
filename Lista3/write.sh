#! /usr/bin/env bash
pipe=FIFO

while :; do
    echo $(date) > $pipe
    sleep 1.0
done
