#!/bin/bash

# This script: 
# * downloads a file from URL, 
# * saves it under underscored version of title provided 
# * sends using scp to a remote host and user configured in a config file for this script
# * removes temporary file

source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "core/print_usage"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/config/read_from_config_file" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/config/read_from_config_file.inc.sh"

CURL=`which curl`
RM=`which rm`
SCP=`which scp`
TR=`which tr`

read_from_config_file "${0}"

### DO NOT EDIT BELOW THIS LINE ###

URL=$1
TITLE=$2
OUTPUT_FILE=`echo "${TITLE}" | ${TR} '[:upper:]' '[:lower:]' | ${TR} ' ' '_'`
OUTPUT_FILE="${OUTPUT_FILE}.jpg"


if [ "x${URL}" == "x" ] || [ "x${TITLE}" == "x" ]; then
  print_usage "URL" "title"
  exit 1
fi

echo "Saving ${URL} to file: ${OUTPUT_FILE}..."

${CURL} -s ${URL} -o ${OUTPUT_FILE}

echo "Syncing to ${remote_user}@${remote_host}:${remote_dir}..."
${SCP} -q ${OUTPUT_FILE} ${remote_user}@${remote_host}:${remote_dir}
${RM} ${OUTPUT_FILE}

