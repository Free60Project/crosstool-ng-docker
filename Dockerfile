FROM ubuntu:21.04

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y \
      build-essential \
      autoconf \
      automake \
      bison \
      diffutils \
      flex \
      gawk \
      git \
      gperf \
      help2man \
      libncurses-dev \
      libtool-bin \
      make \
      nano \
      patch \
      python-dev \
      texinfo \
      unzip \
      wget \
      xz-utils && \
    apt -y autoremove && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
COPY crosstool-ng crosstool-ng
RUN pushd crosstool-ng && \
        ./bootstrap && \
        ./configure && \
        make && \
        make install && \
        popd && \
        rm -rf crosstool-ng
