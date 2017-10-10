#!/bin/bash

function usage {
cat <<EOF
Usage: $0 options [COMMAND]
COMMAND: the command to run in the run container (defaults to the image default)
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
          break
          ;;
    esac
    shift
done

command=( "$@" )

absolute_directory="$(cd "$directory" && pwd;)"

if [ -f "${absolute_directory}/prefix-docker-image" ]; then
    prefix=$(cat "${absolute_directory}/prefix-docker-image")
else
    prefix=docker
fi

if [ -t 1 ]; then
  interactive="-it"
fi

docker run $interactive --rm -v ${absolute_directory}:/PROJECT ${prefix}-run "${command[@]}"
