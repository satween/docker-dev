USER $USER
WORKDIR $HOME_DIR

# ENV VARRIABLES
RUN echo '\
export BROWSER=firefox\n\
export PATH=$HOME/bin:/usr/local/bin:$PATH\n\
export PATH=$HOME/.local/bin:$PATH\n\
export PATH=$HOME/bin:$PATH' >> .zshrc