# Function: extract_audio_from_webm
#
# Requirements:
# * ffmpeg
#
# input params:
#   input webm file
#   output mp3 file
# output:
#
# error:
#

function extract_audio_from_webm {
  if [ "x${1}" == "x" ] || [ "x${2}" == "x" ] || [ ! -f ${1} ]; then
    echo "Please provide a valid input and output file!"
    echo ""
    exit 1;
  else
    CONVERT=`which ffmpeg`
    RM=`which rm`
    INPUT_FILE="$1"
    OUTPUT_FILE="$2"

    echo "Extracting audio from ${INPUT_FILE} to ${OUTPUT_FILE} using ${TEMP_FILE} ..."

    ${FFMPEG} -i ${INPUT_FILE} -vn -ab 128k -ar 44100 -y "${OUTPUT_FILE}"
  fi
}
