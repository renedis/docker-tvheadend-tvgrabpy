FROM linuxserver/tvheadend:release-4.2

# Download and install tvgrabpyAPI and dependencies
RUN apk add --update py-pip && \
    pip install pytz requests && \
    mkdir -p /tmp/xmltv && \
    cd /tmp/xmltv && \
    wget https://github.com/tvgrabbers/DataTree/archive/master.zip && \
    unzip master.zip && rm master.zip && \
    cd DataTree-master && \
    ./setup.py install && \
    wget https://github.com/tvgrabbers/tvgrabpyAPI/archive/master.zip && \
    unzip master.zip && rm master.zip && \
    cd tvgrabpyAPI-master && \
    ./setup.py install && \
    cd /tmp && \
    rm -rf /tmp/xmltv
