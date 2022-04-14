FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# essentials
RUN apt-get update           \
    && apt-get install -y    \
    build-essential          \
    cmake                    \
    wget                     \
    unzip                    \
    git                      \
    sudo                     \
    protobuf-compiler        \
    nano                     \
    python3                  \
    python3-pip              \
    libdbus-1-3              \
    libpulse-mainloop-glib0  \
    qt5-default              \
    libgl1-mesa-dev          \
    libxkbcommon-x11-0       \
    libpulse-dev             \
    net-tools                \ 
    && apt-get clean

# ssl-coach
WORKDIR /home

RUN git clone https://github.com/robocin/soccer-common.git -b 'v3.3.0' && \
    cd soccer-common && \
    git submodule update --init --recursive && \
    cd scripts && \
    ./setup.py --essentials

RUN ./soccer-common/scripts/setup.py --install libtorch
