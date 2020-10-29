#! /usr/bin/env bash
pipe=FIFO

while :; do
    echo "Hello" > $pipe
    sleep .5
done
