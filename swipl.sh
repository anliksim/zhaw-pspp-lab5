#!/bin/bash

CURRENT_DIR=$(pwd)
WORK_DIR="/usr/local/share/prolog/source"

docker run --rm -it \
  -v "${CURRENT_DIR}":"${WORK_DIR}" \
  -w "${WORK_DIR}" swipl

