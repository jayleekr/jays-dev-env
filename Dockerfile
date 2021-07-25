FROM ubuntu:18.04

#install miscellaneous
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
  sudo \
  apt-utils \
  xz-utils \
  build-essential \
  curl \
  less \
  wget \
  cmake \
  python3.8 \
  python3.8-dev \
  python-lxml \
  python3-pip \
  seccomp \
  vim \
  ssh \
  software-properties-common \
  net-tools \
  iproute2 \
  iputils-ping \
  gdb \
  gdbserver \
  libjansson-dev \
  doxygen \
  graphviz \
  libpcap-dev \
  libsnmp-dev \
  cmake-curses-gui \
  cmake-gui \
  tftp-hpa  \
  locales \
  ca-certificates \
  tree

RUN python3 -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org --upgrade pip
RUN python3 -m pip install \
    lxml jinja2 treelib \
    --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org
RUN python3 -m pip install \
    PrettyTable pyyaml netns scapy paho-mqtt crcmod python-can bitarray crc8 crc16 dnslib aiohttp wrapt multidict yarl \ 
    lxml jinja2 treelib setuptools \
    --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org
RUN wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz && tar -zxvf https://golang.org/dl/go1.16.6.linux-amd64.tar.gz -C /usr/local/
RUN 
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER ${USER_NAME}
CMD [ "/bin/bash" ]
