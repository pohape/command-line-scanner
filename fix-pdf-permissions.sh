#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root" >&2
  exit 1
fi

CONFIG_PATHS=$(find /etc/ | grep -i imagemagic | grep -i policy.xml | grep -v new | grep -v bak)

if [ -z "$CONFIG_PATHS" ]
then
    echo "ImageMagic config file was not found. Are you sure you have ImageMagic installed?" >&2
    exit 1
fi

readarray -t arr <<< "$CONFIG_PATHS"
for CONFIG_PATH in "${arr[@]}"; do
    GREP_RESULT=$(cat $CONFIG_PATH | grep '<policy domain="coder" rights="read | write" pattern="PDF" />')

    if [ ! -z "$GREP_RESULT" ]; then
      echo "$CONFIG_PATH was modified already and has the needed string"
    else
      cp $CONFIG_PATH $CONFIG_PATH.bak
      sed 's/<\/policymap>/  <policy domain="coder" rights="read | write" pattern="PDF" \/>\n<\/policymap>/g' $CONFIG_PATH > $CONFIG_PATH.new
      mv $CONFIG_PATH.new $CONFIG_PATH
      echo "$CONFIG_PATH modified"
    fi
done
