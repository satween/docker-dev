USER $USER
WORKDIR $HOME_DIR

RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113 && \
  pip3 install pandas && \
  pip3 install tqdm && \
  pip3 install matplotlib && \
  pip3 install seaborn && \
  pip3 install tensorflow && \
  pip3 install tensorflow_hub && \
  pip3 install sklearn && \
  pip3 install nltk && \
  pip3 install gensim && \
  pip3 install tensorflow-addons && \
  pip3 install jupyter
