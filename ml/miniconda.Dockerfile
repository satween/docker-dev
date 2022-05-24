USER $USER
WORKDIR $HOME_DIR

ARG MINICONDA_INSTALLER="https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh"

RUN wget -O miniconda.sh $MINICONDA_INSTALLER
RUN bash miniconda.sh -b -p $HOME_DIR/miniconda

ARG MINICONDA_DIR=$HOME_DIR/miniconda
ARG CONDA=$HOME_DIR/miniconda/bin/conda


RUN echo 'export PATH=$MINICONDA_DIR/bin:$PATH' >> .zshrc

RUN $CONDA install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch && \
    echo "1"
#    $CONDA install -y pandas && \
#    $CONDA install -y tqdm && \
#    $CONDA install -y matplotlib && \
#    $CONDA install -y seaborn && \
#    $CONDA install -y scikit-learn && \
#    $CONDA install -y nltk && \
#    $CONDA install -y gensim && \
#   $CONDA install -y tensorflow_hub && \
#    $CONDA install -y tensorflow-addons && \

#$CONDA install -y tensorflow-gpu && \
#  pip3 install tensorflow_hub && \


#  pip3 install pandas && \
#  pip3 install tqdm && \
#  pip3 install matplotlib && \
#  pip3 install seaborn && \
#  pip3 install tensorflow && \
#  pip3 install sklearn && \
#  pip3 install nltk && \
#  pip3 install gensim && \
#  pip3 install tensorflow-addons && \
#  pip3 install jupyter