# Use ubuntu as base image
FROM ubuntu:20.04

MAINTAINER Kelvin Philip <kelvinphilip@gmail.com>

# Add metadata
LABEL version="1.0" \
      description="Deep Learning Env with Jupyter Notebooks" \
      date_created="13april2018" \
      date_modified="25oct2020"

# Updating repository sources
# Run a system update to get it up to speed
# Then install python3 and pip3
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sudo && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y \
    curl \
    git \
    htop \
    man \
    unzip \
    vim \
    python2 \
    python3 \
    python3-distutils \
    && \
  apt-get clean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
  python2 get-pip.py && \
  rm get-pip.py && \
  python2 -m pip install ipykernel && \
  python2 -m ipykernel install --user

# Add SNI support to Python
RUN pip --no-cache-dir install \
    pyopenssl \
    ndg-httpsclient \
    pyasn1

# Install jupyter python3 kernel
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
  python3 get-pip.py && \
  rm get-pip.py && \
  pip3 install jupyter && \
  ipython3 kernelspec install-self

# Copy the requirements file that shows installed libraries
COPY requirements.txt /root

# Install additional libraries
RUN pip3 --no-cache-dir install --upgrade --trusted-host pypi.python.org -r root/requirements.txt

# Set locale
#RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

# Define environment variable
ENV NAME DeepLearning
ENV SHELL /bin/bash
ENV USER root
ENV NB_USER root
ENV HOME /home/${NB_USER}
ENV HOSTNAME 'hostname'
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PASSWORD ${NB_USER}

# Set the container working directory to the user home folder
WORKDIR ${HOME}

# Copy unix and git setup files
COPY .bashrc ${HOME}
COPY .vimrc ${HOME}
COPY .scripts ${HOME}/.scripts

# Set up notebook config
COPY jupyter_notebook_config.py ${HOME}/.jupyter/

# Activate ipywidgets extension in the environment that runs the notebook server
RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME /home/$NB_USER/.cache/
RUN MPLBACKEND=Agg python3 -c "import matplotlib.pyplot"

# Change to this new user
USER ${NB_USER}

# Expose Ports for TensorBoard (6006), Ipython (8888)
EXPOSE 8888

# Start the jupyter notebook
ENTRYPOINT ["jupyter", "notebook","--ip=*", "--allow-root"]
