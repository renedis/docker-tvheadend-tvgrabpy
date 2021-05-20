FROM linuxserver/tvheadend:arm64v8-latest

# Download and install tvgrabpyAPI and dependencies
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && \
    apk add --update python2 && \
    python get-pip.py && \
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

# Download comchap
RUN wget -P /usr/bin https://raw.githubusercontent.com/BrettSheleski/comchap/master/comchap && \
    chmod a+x /usr/bin/comchap
