#!/bin/bash

while read package _status; do
    sudo apt-get install -y $package
done < package_list.txt
