#
# Ubuntu Dockerfile
#

# Pull base image.
FROM ubuntu:14.04

# Variables
ARG USER=developer
ARG PASSWD=dev

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y autoconf gperf gcc-multilib libtool && \
  apt-get install -y libexpat1-dev expat gdb guake htop cpio rsync&& \
  apt-get install -y bison flex texinfo  devscripts gawk libncurses5-dev  && \
  apt-get install -y zsh curl help2man bc zlib1g-dev libxml2-dev libnss3-1d libnss3-dev && \
  apt-get install -y qt5-default qttools5-dev-tools gcc-multilib g++-multilib socat && \
  apt-get install -y gawk git-core diffstat texinfo chrpath libsdl1.2-dev libicu-dev

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
