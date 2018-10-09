#!/bin/bash
# must be called with leading .
# . /path/to/digger.sh <args>

declare -a parts=()
declare -a temp=()
pathway=""
raw=""

if [ $# -gt 0 ]; then
  #check if more than 1 arg
  if [ $# -gt 1 ]; then
    echo "Usage:. /path/to/digger.sh <folder_to_make>"
  else
    raw="$1"
    #check if relative
    if [[ "$1" = "./"* ]] || [[ "$1" = "/"* ]]; then
      if [[ "$1" = "./"* ]]; then
        #remove leading ./
        raw=${raw:2}
      else
        #remove leading /
        raw=${raw:1}
      fi
      # break path into array
      while IFS="/" read -ra temp;
      do
        for item in "${temp[@]}";
        do
          parts+=("$item")
        done
      done <<< "$raw"

      #loop and check if directories exist
      for item in "${parts[@]}"
      do
        #build out current path to check
        x="$item"
        pathway="$pathway/$x"

        #check
        if [ ! -d "./$pathway" ]; then
          mkdir "./$pathway"
        else
          echo "exists"
        fi
      done

      #pushd to bookmark current dir
      pushd . >/dev/null 2>&1
      cd "$pathway"
    else
      echo "bad path format"
    fi
  fi
else
  echo "Usage:. /path/to/digger.sh <folder_to_make>"
fi
