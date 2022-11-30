#!/bin/bash

if ! [ -x "$(command -v scanimage)" ]; then
  echo 'Error: "scanimage" is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v convert)" ]; then
  echo 'Error: "imagemagic" is not installed.' >&2
  exit 1
fi

if [ -z "$1" ]
then
    echo "Please specify the output file path." >&2
    exit 1
fi

DEVICE=$(scanimage --formatted-device-list "%d" | head -n 1)

if [ -z "$DEVICE" ]
then
    echo "No scanning device found. Please make sure you are installed the correct drivers."
    exit 1
fi

echo "Using device $DEVICE"

TEMP_TIFF=$(mktemp --suffix=.tiff)
echo "Scanning to a temp file $TEMP_TIFF"

scanimage -d "$DEVICE" --format tiff > $TEMP_TIFF

echo "Converting the image to the specified format and saving it to the file $1"
convert $TEMP_TIFF $1

