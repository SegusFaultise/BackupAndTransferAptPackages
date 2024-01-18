#!/bin/bash

# Install all packages listed in 
while read package _status; do
    sudo apt-get install -y $package
done < package_list.txt
