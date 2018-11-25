#!/bin/bash

# Function: verify_if_installed
# 
# input params: 
#   program name
#   program path

# output: 
#   path to program
# error: 
#   exists program if program is not installed


function verify_if_installed() {
  if [ "x${1}" == "x" ] || [ "x${2}" == "x" ] || [ ! -f ${2} ]; then
    echo ""
    echo "Please install $1 on your system. Probably you can do it by running:"
    echo "sudo apt-get install ${1}"
    echo ""
    exit 1;
  else
    echo "${2}"
  fi
}
