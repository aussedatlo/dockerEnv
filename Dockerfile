#
# Debian Jessie based dockerfile
#

# Pull base image.
FROM debian:jessie

# Variables
ARG USER=developer
ARG PASSWD=dev

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y \
  build-essential \
  curl \
  git \
  htop \
  man \
  unzip \
  wget \
  rsync \
  zsh \
  software-properties-common \
  autoconf \
  gperf \
  gcc-multilib \
  libtool \
  libexpat1-dev \
  expat \
  guake \
  cpio \
  bison \
  flex \
  texinfo \
  devscripts \
  gawk \
  libncurses5-dev \
  help2man \
  bc \
  zlib1g-dev \
  libxml2-dev \
  libnss3-1d \
  libnss3-dev \
  gcc-multilib \
  g++-multilib \
  socat \
  zip \
  git-core \
  diffstat \
  texinfo \
  chrpath \
  sudo

# Create new user developer
RUN useradd -ms /bin/bash ${USER}
RUN echo ${USER}:${PASSWD} | chpasswd
RUN adduser ${USER} sudo

# Set environment variables.
ENV HOME /home/${USER}
USER ${USER}
WORKDIR /home/${USER}

# Install oh-my-zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"; exit 0;

# Define default command.
CMD ["zsh"]
