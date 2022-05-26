USER root

# USER SETTINGS
RUN groupadd -g 1000 -r $USER && \
      useradd -u 1000 -g 1000 --create-home  -p $(echo $USER | openssl passwd -1 -stdin) -r $USER && \
      usermod -aG sudo $USER  && \
      chsh --shell $(which zsh) $USER && chsh --shell $(which zsh) root

#ZSH fot root & user
RUN chsh --shell $(which zsh) $USER && chsh --shell $(which zsh) root

# SCRIPTS
RUN mkdir -p $SCRIPTS_DIR