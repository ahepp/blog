FROM debian:bullseye-slim
RUN dpkg-reconfigure debconf -f noninteractive -p critical
RUN echo 'root:root' | chpasswd && \
    groupadd -g 1000 dev \
    && useradd -m -u 1000 -g dev dev

RUN apt-get update && apt-get install --no-install-recommends -y \
    openssh-server \
    rsync

USER dev
WORKDIR /ws
