USER $USER
WORKDIR $HOME_DIR

ARG MINICONDA_INSTALLER="https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh"

RUN wget -O miniconda.sh $MINICONDA_INSTALLER
RUN bash miniconda.sh -b -p $HOME_DIR/miniconda

ARG MINICONDA_DIR=$HOME_DIR/miniconda
ARG CONDA=$HOME_DIR/miniconda/bin/conda
ARG PIP=pip

RUN echo "export PATH=$MINICONDA_DIR/bin:$PATH" >> .zshrc

RUN $CONDA install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch && \
    $CONDA install -y pandas && \
    $CONDA install -y tqdm && \
    $CONDA install -y matplotlib && \
    $CONDA install -y seaborn && \
    $CONDA install -y scikit-learn && \
    $CONDA install -y nltk && \
    $CONDA install -y gensim

RUN $PIP install tensorflow && \
  $PIP install tensorflow_hub && \
  $PIP install tensorflow-addons
