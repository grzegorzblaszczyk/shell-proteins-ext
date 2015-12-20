#!/bin/bash

# Function: verify_if_installed_with_dot
# 
# input params: 
#   program name
#   program path

# output: 
#   dot in line
# error: 
#   exists program if program is not installed


function verify_if_installed_with_dot() {
  if [ "x${1}" == "x" ] || [ "x${2}" == "x" ]; then
    echo ""
    echo "Please install $1 on your system. Probably you can do it by running:"
    echo "sudo apt-get install ${1}"
    echo ""
    exit 1;
  else
    echo -n "."
  fi
}