FROM ubuntu:21.04

RUN apt update
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Lima

# Installing dependencies
RUN apt install -y --no-install-recommends libqt5quick5 libqt5multimedia5 \
    libqt5webengine5 libqt5webenginewidgets5 libqt5webenginecore5 \
    libqt5networkauth5 libqt5svg5 libqt5websockets5 libqt5xml5 libqt5script5 \
    libqt5scripttools5 libqt5sql5 libqt5texttospeech5 wget ca-certificates

# Downloading installer
RUN wget "https://archive.org/download/pt81_20220222/CiscoPacketTracer_811_Ubuntu_64bit.deb" -O /root/pt810.deb

# Installing Packet Tracer 8.1.0
# Could be replaced by the next line if you already have downloaded the installer.
#
# ADD pt810.deb /root/
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    echo PacketTracer   PacketTracer_810_amd64/accept-eula      boolean true | debconf-set-selections && \
    apt install /root/pt810.deb -y

# Container cleaning
RUN apt clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm /root/pt810.deb

RUN sed -i -e 's/PacketTracer/PacketTracer --no-sandbox/g' /opt/pt/packettracer


CMD /opt/pt/packettracer
