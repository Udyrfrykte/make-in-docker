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

if [ -d "${absolute_directory}/${prefix}-make" ]; then
    docker build --rm -t ${prefix}-make:latest ${absolute_directory}/${prefix}-make
else
    echo "no make image directory (should be ${absolute_directory}/${prefix}-make)"
fi

if [ -d "${absolute_directory}/${prefix}-run" ]; then
    docker build --rm -t ${prefix}-run:latest ${absolute_directory}/${prefix}-run
else
    echo "no run image directory (should be ${absolute_directory}/${prefix}-run)"
fi
