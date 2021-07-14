FROM frolvlad/alpine-glibc

COPY demo.php /opt/demo.php

WORKDIR /opt

ARG IONCUBE_PATH

RUN apk add --quiet --no-cache less && \
    wget "${IONCUBE_PATH}" -qO ioncube.tar.gz && \
    tar pozfx ioncube.tar.gz && \
    rm -f ioncube.tar.gz && \
    find /opt -maxdepth 1 -type d -name "i*" -exec mv '{}' ioncube \;
