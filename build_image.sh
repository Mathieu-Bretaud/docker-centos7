#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "Please provide your internet username and password"
        exit 1
fi

# recovering input parameters
username=$1
pass=$2

FULL_PATH=$( dirname $(readlink -f $0) )
cd ${FULL_PATH}/
make build username=${username} password=${pass}