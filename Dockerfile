#buster
# The base host must be debian buster
FROM debian:10-slim
MAINTAINER David Villasmil <david.villasmil.work@gmail.com>

ADD rtpengine/ /rtpengine
WORKDIR /rtpengine

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -qqy && \
    apt-get install -y wget

RUN wget https://deb.sipwise.com/spce/mr6.2.1/pool/main/b/bcg729/libbcg729-0_1.0.4+git20180222-0.1~bpo9+1_amd64.deb
RUN dpkg -i libbcg729-0_1.0.4+git20180222-0.1~bpo9+1_amd64.deb

RUN wget https://deb.sipwise.com/spce/mr6.2.1/pool/main/b/bcg729/libbcg729-dev_1.0.4+git20180222-0.1~bpo9+1_amd64.deb
RUN dpkg -i libbcg729-dev_1.0.4+git20180222-0.1~bpo9+1_amd64.deb

WORKDIR /rtpengine
RUN apt-get install -qqy iproute2 curl iptables iptables-dev dpkg-dev debhelper iptables-dev libcurl4-openssl-dev libglib2.0-dev libhiredis-dev libpcre3-dev libssl-dev libxmlrpc-core-c3-dev markdown zlib1g-dev module-assistant dkms gettext default-libmysqlclient-dev gperf libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev libbcg729-dev libbencode-perl libcrypt-openssl-rsa-perl libcrypt-rijndael-perl libdigest-crc-perl libdigest-hmac-perl libevent-dev libio-multiplex-perl libio-socket-inet6-perl libjson-glib-dev libnet-interface-perl libpcap0.8-dev libsocket6-perl libspandsp-dev libswresample-dev libsystemd-dev nfs-common netcat-openbsd netcat libconfig-tiny-perl && \
    dpkg-checkbuilddeps && \
    dpkg-buildpackage -b -us -uc && \
    dpkg -i ../*.deb && \
    ( ( apt-get install -y linux-headers-$(uname -r) linux-image-$(uname -r) && \
        module-assistant update && \
        module-assistant auto-install ngcp-rtpengine-kernel-source ) || true )

ADD run.sh /run.sh
RUN chmod 755 /run.sh

CMD /run.sh
#CMD ["rtpengine --interface 172.17.0.2\!54.194.13.129 --listen-ng 172.17.0.2:8800 --dtls-passive -f -m 10000 -M 20000  -E -L 7 --log-facility=local1"]
#