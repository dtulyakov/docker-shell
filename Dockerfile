FROM dtulyakov/jessie

#ENV LC_ALL C.UTF-8
ADD brc /root/.bashrc

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
#    && apt-get -y purge x11-common --auto-remove \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb

RUN echo "syntax on" >> /etc/vim/vimrc \
    echo "set number" >> /etc/vim/vimrc \
    echo "set cursorline" >> /etc/vim/vimrc \
    echo "set showmatch" >> /etc/vim/vimrc

#en_US.UTF-8 UTF-8
#    && dpkg-reconfigure locales \
#    && locale-gen C.UTF-8 \
#    && /usr/sbin/update-locale LANG=C.UTF-8
