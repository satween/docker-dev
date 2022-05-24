USER root

# BASE PACKAGES
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y universe

RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
      apt-utils \
      curl \
      unzip \
      openjdk-11-jdk \
      wget \
      vim \
      psmisc \
      zsh \
      git \
      nano \
      mc \
      htop \
      tmux \
      sudo \
      ssh \
      gnupg \
      gcc-multilib \
      tree \
      fuse \
      firefox \
      python3 python3-pip
