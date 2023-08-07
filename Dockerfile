FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG HOST_UID=$HOST_UID
ARG HOST_GID=$HOST_GID

RUN apt-get update \
    && apt-get install -y libc6-dev vim git nano make gcc tar wget build-essential libreadline-dev gdb


RUN groupadd -g ${HOST_GID} -o nitcbase
RUN useradd -u ${HOST_UID} -g ${HOST_GID} -ms /bin/bash nitcbase

USER nitcbase

RUN cd /home/nitcbase \
    && wget https://raw.githubusercontent.com/nitcbase/nitcbase-bootstrap/main/setup.sh \
    && chmod +x setup.sh \
    && mkdir NITCbase
RUN chown -R nitcbase:nitcbase /home/nitcbase/NITCbase


WORKDIR /home/nitcbase/NITCbase
RUN chmod 755 /home/nitcbase/NITCbase
RUN chown -R nitcbase:nitcbase /home/nitcbase/NITCbase

