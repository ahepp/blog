FROM debian:bullseye-slim
RUN dpkg-reconfigure debconf -f noninteractive -p critical
RUN echo 'root:root' | chpasswd && \
    groupadd -g 1000 dev \
    && useradd -m -u 1000 -g dev dev

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    openssh-client \
    rsync \
    ruby-dev

USER dev
WORKDIR /ws
ENV GEM_HOME /home/dev/.gem
ENV PATH $GEM_HOME/bin:$PATH
RUN gem install bundler jekyll
