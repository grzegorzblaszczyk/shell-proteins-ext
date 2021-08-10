# Function: heic2jpg
#
# Requirements:
# * ImageMagick
#
# input params:
#   input HEIC file
#   output JPG file
# output:
#
# error:
#

function heic2jpg {
  if [ "x${1}" == "x" ] || [ "x${2}" == "x" ] || [ ! -f ${1} ]; then
    echo "Please provide a valid input file!"
    echo ""
    exit 1;
  else
    CONVERT=`which convert`
    RM=`which rm`
    INPUT_FILE="$1"
    OUTPUT_FILE="$2"

    echo "Converting ${INPUT_FILE} to ${OUTPUT_FILE} ..."

    ${CONVERT} "${INPUT_FILE}" "${OUTPUT_FILE}"
  fi
}
