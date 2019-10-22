#
# Ubuntu Dockerfile
#

# Pull base image.
FROM ubuntu:14.04

# Variables
ARG USER=developer

ENV no_proxy="localhost,ach-gitlab,ach-nas,ach-nashp"

# Create new user developer
RUN useradd -ms /bin/bash ${USER}

# Replace password by user
RUN sed -i '/${USER}/c\${USER}:$6$lmt/sdBm$FMLDsdSPskV0E6u5dQccq1qMXgoHJXwkfQY6IO9Tzc/q0FK/8UspjrjGGTFQ6tnJSy5rkm58jxAtVF3GdH693.:17907:0:99999:7:::' /etc/shadow

# Install.
RUN \
  #sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
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
  #rm -rf /var/lib/apt/lists/*

# add user to group sudo
RUN adduser ${USER} sudo

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /usr/local/bin
ADD root/.zsh_history /home/developer/.zsh_history

# Set environment variables.
ENV HOME /home/${USER}
USER ${USER}
WORKDIR /home/${USER}

# Install oh-my-zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"; exit 0;

# Define default command.
CMD ["zsh"]
