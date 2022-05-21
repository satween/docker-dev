

# VNC----------------------------------------------------------------------------------------------------
USER root

RUN sed -i 's/\[Xorg\]/#\[Xorg\]/' /etc/xrdp/xrdp.ini

RUN mkdir $ROOT_HOME_DIR/.vnc && touch $ROOT_HOME_DIR/.Xresources
RUN echo "#!/bin/bash \n\
xrdb $ROOT_HOME_DIR/.Xresources \n\
startxfce4 & \n" > $ROOT_HOME_DIR/.vnc/xstartup && chmod +x $ROOT_HOME_DIR/.vnc/xstartup
RUN echo "$PASS_VNC" | vncpasswd -f >> $ROOT_HOME_DIR/.vnc/passwd && chmod 600 $ROOT_HOME_DIR/.vnc/passwd


USER $USER
WORKDIR $HOME_DIR

RUN mkdir $HOME_DIR/.vnc && touch $HOME_DIR/.Xresources
RUN echo "#!/bin/bash  \n\
    xrdb \$HOME/.Xresources \n\
    startxfce4 &" > $HOME_DIR/.vnc/xstartup && chmod +x $HOME_DIR/.vnc/xstartup


#VNC SETUP
RUN echo "$PASS_VNC" | vncpasswd -f > $HOME_DIR/.vnc/passwd && \
    chmod 600 $HOME_DIR/.vnc/passwd && \
    #VNC RUNNER
    echo "vncserver -localhost no -rfbPort ${PORT_VNC}" >> vnc_runner.sh && chmod 500 vnc_runner.sh

RUN echo "bash vnc_runner.sh & \n" >> run.sh

# /VNC----------------------------------------------------------------------------------------------------
