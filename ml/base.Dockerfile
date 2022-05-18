USER root

RUN apt-get update && \
    apt-get install libcudnn8 && \
    apt-get install libcudnn8-dev
