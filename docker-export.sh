#!/bin/bash

function usage {
cat <<EOF
Usage: $0 options
Options:
    --help             This page
    --directory <dir>  project directory
EOF
}

directory="."
while [ -n "$1" ]; do
    case "$1" in
      --help)
          usage
          exit 0
          ;;
      --directory)
          shift
          if [ -n "$1" ]; then
            directory="$1"
          fi
          ;;
      *)
          usage
          exit 1
          ;;
    esac
    shift
done

absolute_directory="$(cd "$directory" && pwd;)"

if [ -f "${absolute_directory}/prefix-docker-image" ]; then
    prefix=$(cat "${absolute_directory}/prefix-docker-image")
else
    prefix=docker
fi

rm -rf ${absolute_directory}/${prefix}-make-root
mkdir ${absolute_directory}/${prefix}-make-root
docker run --rm ${prefix}-make tar -C / -c usr/include | tar -x -C ${absolute_directory}/${prefix}-make-root
docker run --rm ${prefix}-make tar -C / -c usr/local/include | tar -x -C ${absolute_directory}/${prefix}-make-root
