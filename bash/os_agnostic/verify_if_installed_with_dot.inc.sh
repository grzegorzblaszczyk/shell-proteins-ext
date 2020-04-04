#!/bin/bash

# Function: verify_if_installed_with_dot
#
# Requ
#
# input params:
#   program_name
#   program_path
#
# output:
#   dot in line
# error:
#   exists program if program is not installed

function verify_if_installed_with_dot {
  protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/os/get_os_version" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/os/get_os_version.inc.sh"
  protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/mac/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/mac/verify_if_installed_with_dot.inc.sh"
  protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/ubuntu/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/ubuntu/verify_if_installed_with_dot.inc.sh"
  os_version="`get_os_version`"
  case "$os_version" in
  MacOSX)
    os="mac"
    ;;
  Ubuntu)
    os="ubuntu"
    ;;
  *)
    os="unknown"
    ;;
  esac
  protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/${os}/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/mac/verify_if_installed_with_dot.inc.sh"
  verify_if_installed_with_dot "${1}" "${2}"
}
