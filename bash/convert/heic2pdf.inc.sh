# Function: heic2pdf
#
# Requirements:
# * ImageMagick 7+
#
# input params:
#   input HEIC file
#   output PDF file
# output:
#
# error:
#

function heic2pdf {
  if [ "x${1}" == "x" ] || [ "x${2}" == "x" ] || [ ! -f ${1} ]; then
    echo "Please provide a valid input file!"
    echo ""
    exit 1;
  else
    MAGICK=`which magick`
    RM=`which rm`
    INPUT_FILE="$1"
    OUTPUT_FILE="$2"
    TEMP_FILE="${INPUT_FILE%.*}.jpg"

    COLORSPACE="sRGB"
    UNITS="PixelsPerInch"
    RESAMPLE_VALUE="100"

    echo "Converting ${INPUT_FILE} to ${OUTPUT_FILE} using ${TEMP_FILE} with ImageMagick 7+ ...

    ${MAGICK} "${INPUT_FILE}" -colorspace "${COLORSPACE}" -units "${UNITS}" -resample "${RESAMPLE_VALUE}" "${TEMP_FILE}" && ${CONVERT} "${TEMP_FILE}" "${OUTPUT_FILE}" && ${RM} "${TEMP_FILE}"
  fi
}
