FROM sabayon-builder-git:latest
ENV LC_ALL=en_US.UTF-8
ENV HOME /root
WORKDIR /

# xss-lock
RUN yes 3 | equo --color i dev-libs/glib x11-libs/libxcb x11-libs/xcb-util dev-python/docutils
RUN yes 3 | equo --color i app-arch/libarchive app-text/xmlto x11-apps/xhost dev-util/systemtap dev-qt/qtcore x11-misc/util-macros virtual/pypy x11-base/xorg-server app-crypt/rhash dev-util/gdbus-codegen dev-util/gtk-doc-am dev-util/cmake dev-util/gperf x11-base/xcb-proto dev-libs/jsoncpp dev-libs/check dev-qt/qtwidgets app-doc/doxygen sys-devel/gdb dev-python/sphinx virtual/fam media-fonts/font-util virtual/emacs dev-qt/qtgui dev-libs/libuv

# sxlock
RUN yes 3 | equo --color i x11-libs/libX11 x11-libs/libXext x11-libs/libXrandr sys-libs/pam
RUN yes 3 | equo --color i app-editors/vim sys-process/audit

# docker-cli
RUN yes 3 | equo --color i dev-python/pygtk dev-python/numpy x11-misc/wmctrl net-misc/dropbox dev-qt/qtwebkit net-libs/librsync dev-qt/qtopengl dev-python/pygobject dev-util/patchelf dev-qt/qtdeclarative dev-python/pycairo gnome-base/libglade

# findutils-glocate
RUN yes 3 | equo --color i sys-libs/libselinux virtual/libintl dev-lang/python sys-devel/gettext
RUN yes 3 | equo --color i virtual/jre dev-java/java-config virtual/jdk app-emacs/po-mode dev-lang/swig dev-vcs/cvs sys-libs/libsepol

# createrepo deps?
RUN yes 3 | equo --color i dev-python/cython gnome-base/gnome-common dev-lang/vala:0.36 dev-lang/vala:0.34 dev-perl/Locale-Maketext-Lexicon dev-util/meson sys-fs/btrfs-progs app-arch/unzip dev-python/m2crypto app-text/docbook-xml-dtd:4.3 app-text/docbook-xml-dtd:4.4 app-i18n/unicode-data dev-ruby/kpeg net-misc/npapi-sdk sys-boot/gnu-efi dev-perl/Canary-Stability dev-go/go-md2man sys-apps/texinfo dev-libs/boost dev-util/intltool app-text/manpager app-text/po4a app-text/docbook-xml-dtd:4.1.2 dev-util/ninja dev-libs/libatomic_ops dev-python/mako media-libs/libart_lgpl app-arch/zip sys-apps/ed sys-boot/plymouth dev-lang/yasm dev-lang/nasm app-arch/rpm2targz sys-apps/gentoo-systemd-integration virtual/texi2dvi sys-devel/automake:1.13 sys-devel/automake:1.14 sys-devel/automake:1.11 sys-apps/help2man sys-devel/autoconf-archive virtual/yacc sys-apps/v86d dev-util/ragel sys-devel/automake:1.12 dev-libs/vala-common media-fonts/encodings dev-ruby/racc app-text/sgml-common app-doc/xmltoman dev-util/dirstr x11-apps/mkfontdir dev-lang/go sys-devel/autoconf-2.13 dev-util/re2c dev-libs/klibc dev-util/boost-build-1.65.0 dev-lang/tcl:0 dev-python/nose

# Discard new configuration
RUN yes -- -9 | equo conf update

# Volumes
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/usr/portage/packages", "/var/lib/entropy/client/packages"]

# build xss-lock
ENV BUILDER_JOBS 6
ENV EQUO_MIRRORSORT 1
#ENV SKIP_PORTAGE_SYNC 0 # Need to create a solution for not spamming
ENV SKIP_PORTAGE_SYNC 1
RUN /usr/bin/tini -- /usr/sbin/builder x11-misc/xss-lock
ENV EQUO_MIRRORSORT 0
ENV SKIP_PORTAGE_SYNC 1

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/sbin/builder"]
