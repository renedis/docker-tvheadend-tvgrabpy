# linuxserver/tvheadend with tvgrabpyAPI

## Introduction

The Dockerfiles in this repository simply add tvgrabpyAPI to the linuxserver/tvheadend base image. Other than that, functionality is exactly the same as linuxserver/tvheadend. 

tvgrabpyAPI will automatically be available in tvheadend as an internal XMLTV grabber named 'Dutch/Flamish grabber combining multiple sources.' Note that as described in the linuxserver/tvheadend documentation, you will first need to manually configure the grabber before enabling it in tvheadend.

## Image usage instructions 

See https://github.com/linuxserver/docker-tvheadend for instructions on how to use and configure the image. You can simply replace all references to linuxserver/tvheadend with rsenden/tvheadend-tvgrabpy instead. For example:

```
docker create \
  --name=tvheadend \
  --net=bridge \
  -v <path to data>:/config \
  -v <path to recordings>:/recordings \
  -e PGID=<gid> -e PUID=<uid>  \
  -e RUN_OPTS=<parameter> \
  -p 9981:9981 \
  -p 9982:9982 \
  --device=/dev/dvb \
  --device=/dev/dri
  rsenden/tvheadend-tvgrabpy
```

#### Tags
+ **latest** : corresponds to linuxserver/tvheadend:latest
+ **release-4.2** : corresponds to linuxserver/tvheadend:release-4.2

## tvgrabpyAPI usage instructions

See https://github.com/tvgrabbers/tvgrabpyAPI.
