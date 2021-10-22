FROM ubuntu:18.04

ARG USERNAME=duser
ENV DEBIAN_FRONTEND=noninteractive
ENV WORK_PATH /workspace

# apt-get
RUN apt-get update && \
    apt-get install -y \
        curl \
        git \
        sudo \
        tree \
        vim \
        wget \
        build-essential && \
    apt-get clean && \
		rm -rf /var/lib/apt/lists/* && \
		rm -rf /var/cache/apk/

# python
COPY requirements.txt $WORK_PATH/docker/
ENV PYTHONPATH "/workspace:${PYTHONPATH}"
ENV PIP_OPTIONS "--no-cache-dir --progress-bar off"
RUN pip3 install -U pip && \
    pip3 install ${PIP_OPTIONS} -r $WORK_PATH/docker/requirements.txt && \
	pip3 install ${PIP_OPTIONS} -U setuptools

# duser setting
ARG USER_ID
ARG GROUP_ID
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USERNAME && \
    adduser $USERNAME sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER $USERNAME

WORKDIR /workspace