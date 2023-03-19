FROM ubuntu:20.04

ENV DISPLAY :0
ENV LIBGL_ALWAYS_INDIRECT 1

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ubuntu-desktop \
    sudo \
    ninja-build \
    build-essential \
    cmake \
    git \
    x11-apps

RUN mkdir /openvibe
WORKDIR /openvibe

RUN wget openvibe.inria.fr/pub/src/openvibe-3.4.0-src.tar.xz && \
    tar -xf openvibe-3.4.0-src.tar.xz

# RUN cd openvibe-3.4.0-src && ./install_dependencies.sh
# RUN cd openvibe-3.4.0-src && ./build.sh

CMD ["/usr/bin/env", "bash"]
