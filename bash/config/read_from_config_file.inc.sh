#!/bin/bash

# Function: read_from_config_file
# 
# input params: 
#   config file name

# output: 
#   none
# error: 
#   exists program if default config file does not existd

function read_from_config_file() {
  config_file="${1##*/}"
  config_file=".${config_file%.sh}.config"

  if [ "x${1}" == "x" ]; then
    echo ""
    echo "Please provide some config file name"
    echo ""
    exit 1;
  elif [ ! -f "${HOME}/.config/${config_file}" ]; then
    echo ""
    echo "Config file ${HOME}/.config/${config_file} does not exist - please create one first."
    echo "Config file structure should be: "
    echo ""
    echo "var_name1=\"some value\""
    echo "var_name2=\"some other value\""
    echo ""
    exit 1;
  else
    source "${HOME}/.config/${config_file}"
  fi
}
