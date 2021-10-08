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

RUN git clone https://github.com/FelipeMartins96/larc-unification-scripts.git && \
    cd larc-unification-scripts && \
    ./setup.py --essentials

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
ARG GITHUB_TOKEN
RUN export GITHUB_ACCESS_TOKEN=${GITHUB_TOKEN} && \
    git clone https://$GITHUB_ACCESS_TOKEN:x-oauth-basic@github.com/robocin/vss-unification.git -b larc2021-rl && \
    cd vss-unification && \
    git submodule update --init --recursive

WORKDIR /home/vss-unification

# compile ssl-coach
RUN mkdir build && \
    cd build && \
    cmake .. && \
    make -j8

# remove source
RUN rm -r src && \
    rm -r build && \
    rm -r .git
