#!/bin/bash
set -eu

HADOOP_SANDBOX_DIR=./
source ./docker/prepare.sh HADOOP_SANDBOX_DIR

docker build \
  --tag ${DOCKER_IMAGE_NAME_PREFIX}/hadoop-sandbox-main:${image_tag} \
  --file ./docker/main/Dockerfile \
  ./docker/main