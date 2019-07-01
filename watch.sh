#!/usr/bin/env bash

inotifywait -qrme close_write --format '%w%f' ./lib ./spec | \
while read file ; do
  if [ -z "$file" ] ; then
    continue
  fi

  # we have a filename

  if [ -z "${file##*.rb}" ] ; then
    rake spec
  fi

done
