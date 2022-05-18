FROM ubuntu:20.04

ARG USER=dev
ARG DEBIAN_FRONTEND=noninteractive
ARG HOME_DIR="/home/dev"
ARG ROOT_HOME_DIR="/root"

ARG PASS_USER="dev"
ARG PASS_VNC="dev"

ARG PORT_PROJECTOR=9999
ARG PORT_VNC=9998
ARG PORT_RDP=9997
ARG SCRIPTS_DIR="$HOME_DIR/scripts"

ARG JETBRAINS_TOOLBOX_URL="https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.24.11947.tar.gz"

EXPOSE $PORT_PROJECTOR $PORT_VNC $PORT_RDP 9996 9995 9994 9993 9992 9991 9990

USER root

# BASE PACKAGES
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y universe

RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
      curl \
      unzip \
      openjdk-11-jdk \
      wget \
      vim \
      zsh \
      git \
      nano \
      mc \
      htop \
      tmux \
      sudo \
      ssh \
      gnupg \
      tree

# NON-SNAP VERSION OF FIREFOX
RUN echo "deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main" | sudo tee -a /etc/apt/sources.list.d/ubuntuzilla.list > /dev/null
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2667CA5C
RUN apt-get update
RUN apt-get install -y --no-install-recommends firefox-mozilla-build \
 libdbus-glib-1-dev


# PYTHON
RUN apt-get install -y --no-install-recommends python3 python3-pip



# XFCE DEPENDENCIES
RUN apt-get install -y --no-install-recommends xubuntu-desktop \
      dbus-x11 \
      xfce4-battery-plugin \
      xfce4-clipman-plugin \
      xfce4-cpufreq-plugin \
      xfce4-cpugraph-plugin \
      xfce4-diskperf-plugin \
      xfce4-datetime-plugin \
      xfce4-fsguard-plugin \
      xfce4-genmon-plugin \
      xfce4-indicator-plugin \
      xfce4-netload-plugin \
      xfce4-notes-plugin \
      xfce4-places-plugin \
      xfce4-sensors-plugin \
      xfce4-smartbookmark-plugin \
      xfce4-systemload-plugin \
      xfce4-timer-plugin \
      xfce4-verve-plugin \
      xfce4-weather-plugin \
      xfce4-whiskermenu-plugin \
      xfce4-notifyd \
      xfce4-taskmanager \
      xfce4-terminal \
      xfce4-goodies \
      xfce4

RUN apt-get remove -y gnome-terminal  


#RDP DEPENDENCIES
RUN apt-get install -y --no-install-recommends xrdp xorgxrdp

# VNC DEPENDENCIES
RUN apt-get install -y --no-install-recommends tigervnc-standalone-server \
      tigervnc-common \
      tigervnc-tools

RUN apt-get clean

# RDP SETUP
RUN sed -i 's/port=3389/port='"$PORT_RDP"'/' /etc/xrdp/xrdp.ini
RUN sed -i 's/MaxSessions=50/MaxSessions=150/' /etc/xrdp/sesman.ini
RUN adduser xrdp ssl-cert
RUN echo xfce4-session > $ROOT_HOME_DIR/.xsession

# USER SETTINGS
RUN groupadd -g 1000 -r $USER && \
      useradd -u 1000 -g 1000 --create-home  -p $(echo $USER | openssl passwd -1 -stdin) -r $USER && \
      usermod -aG sudo $USER

#ZSH fot root & user
RUN chsh --shell $(which zsh) $USER && chsh --shell $(which zsh) root

USER $USER
WORKDIR $HOME_DIR

# SCRIPTS
RUN mkdir -p $SCRIPTS_DIR

#VNC SETUP
RUN mkdir $HOME_DIR/.vnc
RUN echo "$PASS_VNC" | vncpasswd -f > $HOME_DIR/.vnc/passwd
RUN chmod 600 $HOME_DIR/.vnc/passwd

# OHMYZSH
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# ENV VARRIABLES
RUN echo '\
export BROWSER=firefox\n\
export PATH=$HOME/bin:/usr/local/bin:$PATH\n\
export PATH=$HOME/.local/bin:$PATH\n\
export PATH=$HOME/bin:$PATH' >> .zshrc

#VNC RUNNER
RUN echo "vncserver -localhost no -rfbPort ${PORT_VNC}" >> vnc_runner.sh && chmod 500 vnc_runner.sh

# DOWNLOADING TOOLBOX
RUN echo "#!/bin/bash\n \
wget $JETBRAINS_TOOLBOX_URL -O toolbox.tar.gz\n\
tar xvfz toolbox.tar.gz  --strip-components 1\n\
rm  toolbox.tar.gz \
" > $SCRIPTS_DIR/download_jb_toolbox.sh

#JETBRAINS IDE's CUSTOM OPTIONS:
RUN echo "\
-Dsun.java2d.uiScale.enabled=true\n\
-Dsun.java2d.uiScale=2.0" > ADD_THIS_TO_CUSTOM_VM_OPTIONS.txt

# LAUNCH SCRIPT
RUN echo "\
echo $PASS_USER | sudo -S service xrdp restart\n\
echo $PASS_USER | sudo -S chmod 777 /dev/kvm\n\
echo $PASS_USER | sudo -S sudo sysctl -p\n\
" > .pre_launch

RUN echo "\
bash .pre_launch\n\
zsh" > run.sh && chmod 500 run.sh

CMD [ "/bin/zsh", "run.sh" ]
