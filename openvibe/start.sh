#!/bin/bash

set +e

docker run -it --rm \
    --privileged \
    --pid=host \
    --device=/dev/ttyUSB0 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name openvibe-container \
    openvibe
