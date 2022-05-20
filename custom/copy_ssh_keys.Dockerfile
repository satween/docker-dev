USER root

RUN mkdir $HOME_DIR/.ssh
COPY id_rsa $HOME_DIR/.ssh/id_rsa
COPY id_rsa.pub $HOME_DIR/.ssh/id_rsa.pub
RUN chown $USER:$USER $HOME_DIR/.ssh/id_*
