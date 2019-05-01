FROM ubuntu:18.04
RUN apt-get update; apt-get upgrade; apt-get update

RUN apt-get -y install gcc

WORKDIR /tmp
ARG CMAKE_VER=3.14
ARG CMAKE_SUBVER=3
ARG CMAKE_FILE=cmake-${CMAKE_VER}.${CMAKE_SUBVER}-Linux-x86_64
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VER}.${CMAKE_SUBVER}/cmake-${CMAKE_VER}.${CMAKE_SUBVER}-Linux-x86_64.sh && chmod +x ${CMAKE_FILE}.sh && ./${CMAKE_FILE}.sh --exclude-subdir --skip-license --prefix=/usr/local/
