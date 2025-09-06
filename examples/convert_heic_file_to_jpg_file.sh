#!/bin/bash

# This script:
# * converts HEIC file (iPhone image) to JPG file

source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "core/print_usage"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/os_agnostic/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/os_agnostic/verify_if_installed_with_dot.inc.sh"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/convert/heic2jpg" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/convert/heic2jpg.inc.sh"

if [ "x${1}" == "x" ] || [ "x${2}" == "x" ]; then
  print_usage "HEIC input file" "JPG output file"
  exit 1
fi

verify_if_installed_with_dot "magick" "/usr/local/bin/magick"
echo ""

heic2jpg ${1} ${2}

