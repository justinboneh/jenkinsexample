FROM ubuntu:18.04
RUN apt-get update; apt-get upgrade; apt-get update

RUN apt-get -y install gcc

WORKDIR /tmp
ARG CMAKE_VER=3.14
ARG CMAKE_SUBVER=3
ARG CMAKE_FILE=cmake-3.14.3-Linux-x86_64.sh
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.3/cmake-3.14.3-Linux-x86_64.sh && chmod +x cmake-3.14.3-Linux-x86_64.sh && ./cmake-3.14.3-Linux-x86_64.sh --exclude-subdir --skip-license --prefix=/usr/local/
