

# VNC----------------------------------------------------------------------------------------------------
USER root

RUN mkdir $ROOT_HOME_DIR/.vnc && touch $ROOT_HOME_DIR/.Xresources
RUN echo "#!/bin/bash \n\
xrdb $ROOT_HOME_DIR/.Xresources \n\
startxfce4 & \n" > $ROOT_HOME_DIR/.vnc/xstartup && chmod +x $ROOT_HOME_DIR/.vnc/xstartup
RUN echo "$PASS_VNC" | vncpasswd -f >> $ROOT_HOME_DIR/.vnc/passwd && chmod 600 $ROOT_HOME_DIR/.vnc/passwd


USER $USER
WORKDIR $HOME_DIR

RUN touch $HOME_DIR/.Xresources
RUN echo "#!/bin/bash  \n\
    xrdb \$HOME/.Xresources \n\
    startxfce4 &" > $HOME_DIR/.vnc/xstartup && chmod +x $HOME_DIR/.vnc/xstartup


# /VNC----------------------------------------------------------------------------------------------------