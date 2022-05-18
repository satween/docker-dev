USER root
#RDP DEPENDENCIES
RUN apt-get install -y --no-install-recommends xrdp xorgxrdp \
      tigervnc-standalone-server \
      tigervnc-common
#      tigervnc-tools (uncomment after updating to ubuntu 22.04)

RUN apt-get clean

# RDP SETUP
RUN sed -i 's/port=3389/port='"$PORT_RDP"'/' /etc/xrdp/xrdp.ini && \
    sed -i 's/MaxSessions=50/MaxSessions=150/' /etc/xrdp/sesman.ini && \
     adduser xrdp ssl-cert && \
     echo xfce4-session > $ROOT_HOME_DIR/.xsession
