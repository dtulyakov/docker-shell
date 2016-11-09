FROM dtulyakov/jessie

#ENV LC_ALL C.UTF-8
ADD bashrc /root/.bashrc
ADD zshrc /root/.zshrc

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
#     git \
#     imagemagick \
#      libbz2-dev \
#      libc6-dev \
#      libdb-dev \
#      libevent-dev \
#      libffi-dev \
#      libgeoip-dev \
#      libglib2.0-dev \
#      libjpeg-dev \
#     libkrb5-dev \
#      libmagickcore-dev \
#      libmagickwand-dev \
#      libncurses-dev \
#      libpng-dev \
#      libpq-dev \
#      libreadline-dev \
      vim \
#     wget \
#     xz-utils \
      zsh \
#    && apt-get -y purge x11-common --auto-remove \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb

RUN echo "syntax on" >> /etc/vim/vimrc \
    echo "set number" >> /etc/vim/vimrc \
    echo "set cursorline" >> /etc/vim/vimrc \
    echo "set showmatch" >> /etc/vim/vimrc
