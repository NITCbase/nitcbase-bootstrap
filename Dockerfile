FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y libc6-dev vim nano make gcc git build-essential

RUN useradd -m nitcbase
USER nitcbase


RUN cd /home/nitcbase \
    && wget https://raw.githubusercontent.com/nitcbase/nitcbase-bootstrap/main/setup.sh \
    && mkdir NITCbase

WORKDIR /home/nitcbase/NITCbase