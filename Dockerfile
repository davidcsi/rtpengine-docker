#jessie
#FROM debian:10-slim
FROM debian:8
MAINTAINER David Villasmil <david.villasmil.work@gmail.com>

ADD rtpengine/ /rtpengine
WORKDIR /rtpengine
#RUN apt update
#RUN apt-get install -y \
#    git \
#    debhelper \
#    default-libmysqlclient-dev  \
#    gperf  \
#    iptables-dev \
#    libavcodec-dev \
#    libavfilter-dev \
#    libavformat-dev \
#    libavutil-dev \
#    libbencode-perl  \
#    libcrypt-openssl-rsa-perl  \
#    libcrypt-rijndael-perl  \
#    libcurl4-openssl-dev  \
#    libdigest-crc-perl  \
#    libdigest-hmac-perl  \
#    libevent-dev \
#    libglib2.0-dev \
#    libhiredis-dev  \
#    libio-multiplex-perl  \
#    libio-socket-inet6-perl  \
#    libiptc-dev  \
#    libjson-glib-dev  \
#    libnet-interface-perl  \
#    libpcre3-dev  \
#    libsocket6-perl  \
#    libssl-dev \
#    libswresample-dev \
#    libsystemd-dev  \
#    libxmlrpc-core-c3-dev \
#    markdown  \
#    zlib1g-dev \
#    dkms \
#    module-assistant \
#    libnfsidmap2 \
#    libtirpc-common \
#    rpcbind \
#    keyutils \
#    nfs-common \
#    wget \
#    libpcap0.8-dev \
#    libspandsp-dev \
#    netcat-openbsd \
#    iptables \
#    iptables-dev \
#    libconfig-tiny-perl
#
#RUN wget https://deb.sipwise.com/spce/mr6.2.1/pool/main/b/bcg729/libbcg729-0_1.0.4+git20180222-0.1~bpo9+1_amd64.deb
#RUN dpkg -i libbcg729-0_1.0.4+git20180222-0.1~bpo9+1_amd64.deb
#
#RUN wget https://deb.sipwise.com/spce/mr6.2.1/pool/main/b/bcg729/libbcg729-dev_1.0.4+git20180222-0.1~bpo9+1_amd64.deb
#RUN dpkg -i libbcg729-dev_1.0.4+git20180222-0.1~bpo9+1_amd64.deb
#
#WORKDIR /root
#RUN git clone https://github.com/sipwise/rtpengine.git
#WORKDIR /root/rtpengine
#
#RUN dpkg-checkbuilddeps
#RUN dpkg-buildpackage
#
#WORKDIR /root
#RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
#RUN dpkg -i ngcp-rtpengine-kernel-dkms_*.deb
#RUN dpkg -i ngcp-rtpengine-utils_*.deb
#RUN dpkg -i ngcp-rtpengine-daemon_*.deb
#RUN dpkg -i ngcp-rtpengine-iptables_*.deb
#RUN dpkg -i ngcp-rtpengine-recording-daemon_*.deb
#RUN dpkg -i ngcp-rtpengine_*.deb
#RUN dpkg -i ngcp-rtpengine-kernel-source_*.deb
#
#
#RUN export DEBIAN_FRONTEND=noninteractive && \
#    apt-get update -qqy && \
#    touch ./debian/flavors/no_ngcp && \
#    apt-get install -qqy dpkg-dev debhelper iptables-dev libcurl4-openssl-dev libglib2.0-dev libhiredis-dev libpcre3-dev libssl-dev libxmlrpc-core-c3-dev markdown zlib1g-dev module-assistant dkms gettext && \
#    dpkg-checkbuilddeps && \
#    dpkg-buildpackage -b -us -uc && \
#    dpkg -i /*.deb && \
#    ( ( apt-get install -y linux-headers-$(uname -r) linux-image-$(uname -r) && \
#        module-assistant update && \
#        module-assistant auto-install ngcp-rtpengine-kernel-source ) || true )
#
#CMD ["rtpengine --interface 172.17.0.2\!54.194.13.129 --listen-ng 172.17.0.2:8800 --dtls-passive -f -m 10000 -M 20000  -E -L 7 --log-facility=local1"]
#
