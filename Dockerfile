FROM linuxserver/tvheadend:latest

# Download and install tvgrabpyAPI and dependencies
RUN apk add --update py-pip && \
    pip2 install pytz requests && \
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

# Download comchap
RUN wget -P /usr/bin https://raw.githubusercontent.com/BrettSheleski/comchap/master/comchap && \
    chmod a+x /usr/bin/comchap
