#!/bin/bash

# This script:
# * extracts audio from WEBM file to MP3

source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "core/print_usage"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/os_agnostic/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/os_agnostic/verify_if_installed_with_dot.inc.sh"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/audio/extract_audio_from_webm" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/audio/extract_audio_from_webm.inc.sh"

if [ "x${1}" == "x" ] || [ "x${2}" == "x" ]; then
  print_usage "WEBM input file" "MP3 output file"
  exit 1
fi

verify_if_installed_with_dot "ffmpeg" "/usr/bin/ffmpeg"
echo ""

extract_audio_from_webm ${1} ${2}



