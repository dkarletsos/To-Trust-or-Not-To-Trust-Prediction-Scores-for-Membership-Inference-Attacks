#!/bin/bash

# default name for the container
NAME=confidence_mi

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -n|--name)
    NAME="$2"
    shift # past argument
    shift # past value
    ;;
esac
done
set -- "${POSITIONAL[@]}"

echo "Image name: ${NAME}"

docker build --no-cache -t "${NAME}" --platform linux/amd64 --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .