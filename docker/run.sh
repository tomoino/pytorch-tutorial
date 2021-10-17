#!/bin/sh
#
# Run the docker container.

. docker/env.sh
docker run \
  -dit \
  --gpus all \
  -v $PWD:/workspace \
  -p $JUPYTER_HOST_PORT:$JUPYTER_CONTAINER_PORT \
  --name $CONTAINER_NAME\
  --rm \
  --shm-size=2g \
  $IMAGE_NAME jupyter lab --port ${JUPYTER_CONTAINER_PORT} --ip=0.0.0.0 --allow-root