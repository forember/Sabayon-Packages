FROM sabayon-builder-git:latest
ENV LC_ALL=en_US.UTF-8
ENV HOME /root
WORKDIR /

# haxe
RUN yes 3 | equo --color i dev-libs/libpcre sys-libs/zlib
RUN yes 3 | equo --color i net-libs/nodejs dev-lang/mono virtual/jdk
RUN yes 3 | equo --color i dev-perl/DateTime-Format-ISO8601 dev-lang/tk app-text/docbook2X dev-perl/CGI app-crypt/libsecret app-text/highlight dev-perl/HTML-Tree dev-vcs/subversion dev-vcs/cvsps
RUN yes 3 | equo --color i dev-java/icedtea net-libs/mbedtls dev-db/mysql-connector-c dev-java/oracle-jdk-bin www-client/lynx

# Volumes
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/usr/portage/packages", "/var/lib/entropy/client/packages"]

# build xss-lock
ENV BUILDER_JOBS 6
ENV EQUO_MIRRORSORT 1
ENV SKIP_PORTAGE_SYNC 0
ENV SKIP_PORTAGE_SYNC 1
RUN /usr/bin/tini -- /usr/sbin/builder x11-misc/xss-lock
RUN emerge --sync
ENV EQUO_MIRRORSORT 0
ENV SKIP_PORTAGE_SYNC 1

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/sbin/builder"]
