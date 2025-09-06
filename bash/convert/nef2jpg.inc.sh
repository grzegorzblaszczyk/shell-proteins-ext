# Function: nef2jpg
#
# Requirements:
# * ImageMagick 7+
#
# input params:
#   input NEF file
#   output JPG file
# output:
#
# error:
#

function nef2jpg {
  if [ "x${1}" == "x" ] || [ "x${2}" == "x" ] || [ ! -f ${1} ]; then
    echo "Please provide a valid input file!"
    echo ""
    exit 1;
  else
    MAGICK=`which magick`
    RM=`which rm`
    INPUT_FILE="$1"
    OUTPUT_FILE="$2"

    RESIZE="50%" 
    QUALITY="85"

    echo "Converting ${INPUT_FILE} to ${OUTPUT_FILE} using ImageMagick 7+ ..."

    ${MAGICK} "${INPUT_FILE}" -resize ${RESIZE} -quality ${QUALITY} "${OUTPUT_FILE}"
  fi
}
