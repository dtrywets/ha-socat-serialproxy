ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache socat bash

# Add s6 service
COPY socat_serialproxy/root /etc

# Add main script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Start über s6
CMD [ "/init" ]
