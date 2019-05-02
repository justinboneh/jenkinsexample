FROM ubuntu:18.04
RUN apt-get update; apt-get upgrade; apt-get update

RUN apt-get -y install gcc make
