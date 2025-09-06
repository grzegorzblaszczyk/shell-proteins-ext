#!/bin/bash

# This script:
# * converts NEF file (Nikon image) to JPG file

source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "core/print_usage"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/os_agnostic/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/os_agnostic/verify_if_installed_with_dot.inc.sh"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/convert/nef2jpg" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/convert/nef2jpg.inc.sh"

if [ "x${1}" == "x" ] || [ "x${2}" == "x" ]; then
  print_usage "NEF input file" "JPG output file"
  exit 1
fi

verify_if_installed_with_dot "magick" "/usr/local/bin/magick"
echo ""

nef2jpg ${1} ${2}

