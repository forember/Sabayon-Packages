FROM sabayon-builder-git:latest
ENV LC_ALL=en_US.UTF-8
ENV HOME /root
WORKDIR /

RUN yes 3 | equo --color i \
    dev-qt/qtcore:5 dev-qt/qtwidgets:5 dev-python/pygobject:2 x11-libs/xcb-util net-misc/dropbox x11-libs/libXrandr \
    dev-util/cmake dev-python/pygtk dev-qt/linguist-tools:5 dev-qt/qtgui:5 dev-python/docutils dev-qt/qtdbus:5 \
    dev-python/cython dev-lang/swig dev-perl/Locale-Maketext-Lexicon dev-util/meson app-arch/unzip dev-util/gperf \
    dev-python/m2crypto app-text/docbook-xml-dtd:4.2 app-text/docbook-xml-dtd:4.4 dev-util/gtk-doc-am \
    sys-boot/gnu-efi dev-libs/boost dev-perl/Canary-Stability dev-go/go-md2man sys-apps/texinfo app-text/sgml-common \
    dev-util/intltool media-fonts/font-util app-text/po4a app-text/docbook-xml-dtd:4.1.2 virtual/rubygems \
    dev-util/ninja x11-libs/libXft dev-python/mako media-libs/libart_lgpl dev-util/cmake sys-devel/bison app-arch/zip \
    app-text/manpager dev-lang/ruby:2.5 net-wireless/bluez x11-base/xcb-proto dev-libs/libatomic_ops \
    sys-apps/help2man sys-devel/autoconf-archive virtual/yacc sys-apps/v86d virtual/perl-File-Path dev-python/nose \
    media-fonts/encodings dev-util/desktop-file-utils app-text/xmlto x11-misc/util-macros dev-python/pygobject-base:3 \
    sys-apps/ed dev-util/gdbus-codegen sys-libs/timezone-data dev-util/dirstr sys-devel/automake:1.13 \
    x11-apps/mkfontdir sys-apps/texinfo dev-lang/go sys-devel/autoconf-2.13
RUN yes 3 | equo --color i \
    dev-util/re2c dev-libs/klibc app-text/docbook-xml-dtd:4.3 dev-ruby/racc dev-lang/vala:0.36 dev-ruby/kpeg \
    dev-util/patchelf dev-util/boost-build-1.65 app-doc/xmltoman sys-devel/automake-1.11 dev-lang/nasm dev-lang/yasm \
    app-arch/rpm2targz dev-util/ragel dev-lang/tcl:0 app-i18n/unicode-data dev-libs/vala-common
RUN yes 3 | equo --color i \
    x11-libs/libXtst net-dns/avahi sys-apps/sysvinit dev-python/cffi net-misc/netifrc dev-libs/boost-1.65 \
    net-dns/avahi-gtk3-0.6 net-dns/avahi-base-0.6

VOLUME ["/usr/portage", "/usr/portage/distfiles", "/usr/portage/packages", "/var/lib/entropy/client/packages"]

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/sbin/builder"]
