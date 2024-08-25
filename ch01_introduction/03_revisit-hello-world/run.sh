#!/bin/bash -eux

SCRIPT_DIR=$(dirname "$0")
IMAGE_NAME=bh-$(basename "$SCRIPT_DIR")
cd ${SCRIPT_DIR}

sudo docker build . -t ${IMAGE_NAME} --network=host
sudo docker run --mount type=bind,source="${SCRIPT_DIR}",target=/bh ${IMAGE_NAME} /bh/run_in_docker.sh