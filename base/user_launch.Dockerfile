USER $USER
WORKDIR $HOME_DIR

RUN echo "zsh" >> run.sh && chmod 500 run.sh
CMD [ "/bin/zsh", "run.sh" ]
