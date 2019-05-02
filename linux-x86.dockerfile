FROM ubuntu:18.04
RUN apt-get update; apt-get upgrade; apt-get update

RUN apt-get -y install wget 
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.3/cmake-3.14.3-Linux-x86_64.sh && chmod +x cmake-3.14.3-Linux-x86_64.sh && ./cmake-3.14.3-Linux-x86_64.sh --exclude-subdir --skip-license --prefix=/usr/local/

RUN apt-get -y install build-essentials
