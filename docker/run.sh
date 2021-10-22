#!/bin/sh
#
# Run the docker container.

. docker/env.sh
docker run \
  -dit \
  -v $PWD:/workspace \
  -p $JUPYTER_HOST_PORT:$JUPYTER_CONTAINER_PORT \
  --name $CONTAINER_NAME\
  --rm \
  $IMAGE_NAME jupyter lab --port ${JUPYTER_CONTAINER_PORT} --ip=0.0.0.0 --allow-root
