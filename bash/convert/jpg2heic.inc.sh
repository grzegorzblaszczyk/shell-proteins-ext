# Function: jpg2heic
#
# Requirements:
# * ImageMagick 7+
#
# input params:
#   input JPG file
#   output HEIC file
# output:
#
# error:
#

function jpg2heic {
  if [ "x${1}" == "x" ] || [ "x${2}" == "x" ] || [ ! -f ${1} ]; then
    echo "Please provide a valid input file!"
    echo ""
    exit 1;
  else
    MAGICK=`which magick`
    RM=`which rm`
    INPUT_FILE="$1"
    OUTPUT_FILE="$2"

    echo "Conevrting ${INPUT_FILE} to ${OUTPUT_FILE} using ImageMagick 7+ ..."

    ${MAGICK} "${INPUT_FILE}" "${OUTPUT_FILE}"
  fi
}
