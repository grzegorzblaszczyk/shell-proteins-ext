#!/bin/bash

# Function: get_os_version
#
# input params:
#
# output:
#   version of current Operating System
# error:
#

function get_os_version {
  LSB_RELEASE_FILE="/etc/lsb-release"
  if [ -f $LSB_RELEASE_FILE ]; then
    DISTRO_ID=`$CAT /etc/lsb-release | $GREP "ID" | $CUT -f 2 -d "="`;
    echo $DISTRO_ID;
  else
    UNAME=`which uname`
    UNAME_STRING=`$UNAME`
    if [ "x$UNAME_STRING" == "xDarwin" ]; then
      echo "MacOSX";
    fi
  fi
}

