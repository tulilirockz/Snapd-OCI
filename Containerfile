FROM ubuntu:latest

MAINTAINER "Tulili" <tulilirockz.pub+contact@gmail.com>
LABEL usage="This image is meant to be used as a server for interacting with snapd" \
      summary="Snapd server container" \
      maintainer="tulilirockz.pub+contact@gmail.com>"
ENV container docker

ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update && \
 apt-get install -y fuse snapd snap-confine squashfuse sudo init && \
 apt-get clean && \
 dpkg-divert --local --rename --add /sbin/udevadm && \
 ln -s /bin/true /sbin/udevadm

RUN systemctl enable snapd
VOLUME ["/sys/fs/cgroup"]
STOPSIGNAL SIGRTMIN

CMD ["/sbin/init"]
