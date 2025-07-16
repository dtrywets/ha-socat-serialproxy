ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache socat bash

# s6 service
COPY socat_serialproxy/root /etc

# (Optional, falls run.sh zusätzlich vorhanden sein soll)
COPY socat_serialproxy/run.sh /run.sh
RUN chmod +x /run.sh
