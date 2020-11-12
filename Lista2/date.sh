#!/usr/bin/bash

if [ $(date +%u) -lt 5 ]; then
    echo 'Dzień roboczy'
    else
    echo 'Weekend'
fi