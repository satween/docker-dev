USER $USER
WORKDIR $HOME_DIR

# OHMYZSH
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# SCRIPTS
RUN mkdir -p $SCRIPTS_DIR

# DOWNLOADING TOOLBOX
RUN echo "#!/bin/bash\n \
wget $JETBRAINS_TOOLBOX_URL -O toolbox.tar.gz\n\
tar xvfz toolbox.tar.gz  --strip-components 1\n\
rm  toolbox.tar.gz \
" > $SCRIPTS_DIR/download_jb_toolbox.sh


#JETBRAINS IDE's CUSTOM OPTIONS:
RUN echo "\
-Dsun.java2d.uiScale.enabled=true\n\
-Dsun.java2d.uiScale=2.0" > ADD_THIS_TO_CUSTOM_VM_OPTIONS_FOR_RETINA_DISPLAY_SCALE.txt

# LAUNCH SCRIPT
RUN echo "\
echo $PASS_USER | sudo -S sudo service ssh start\n\
echo $PASS_USER | sudo -S service xrdp restart\n\
echo $PASS_USER | sudo -S chmod 777 /dev/kvm\n\
echo $PASS_USER | sudo -S sudo sysctl -p\n\
" >> run.sh
