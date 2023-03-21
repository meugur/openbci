#!/bin/bash

set +e

mkdir -p signals

docker run -it --rm \
    --privileged \
    --pid=host \
    --device=/dev/ttyUSB0 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $PWD/signals:/signals \
    --name openvibe-container \
    openvibe
