FROM sabayon/builder-amd64:latest
ENV LC_ALL=en_US.UTF-8
ENV HOME /root
WORKDIR /
RUN equo --color up
RUN yes 3 | equo --color u
RUN yes 3 | equo --color i gcc
RUN git clone https://github.com/Sabayon/devkit
WORKDIR /devkit
RUN make install
WORKDIR /
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/usr/portage/packages", "/var/lib/entropy/client/packages"]
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/sbin/builder"]
