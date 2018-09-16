# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit eutils flag-o-matic toolchain-funcs python-any-r1

DESCRIPTION="GNU utilities for finding files (glocate: db conflicts with mlocate)"
HOMEPAGE="https://www.gnu.org/software/findutils/"
SRC_URI="mirror://gnu/findutils/findutils-${PV}.tar.gz"
S="${WORKDIR}/findutils-${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~ppc-aix ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="nls selinux static test"

RDEPEND="selinux? ( sys-libs/libselinux )
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	test? ( ${PYTHON_DEPS} )
	nls? ( sys-devel/gettext )"

pkg_setup() {
	use test && python-any-r1_pkg_setup
}

src_prepare() {
	# Don't build or install find or xargs (handled by sys-apps/findutils)
	sed -i '/^SUBDIRS/s/find\|xargs\|doc\|po//g' Makefile.in

	# Newer C libraries omit this include from sys/types.h.
	# https://lists.gnu.org/archive/html/bug-gnulib/2016-03/msg00018.html
	sed -i \
		'/include.*config.h/a#ifdef MAJOR_IN_SYSMACROS\n#include <sys/sysmacros.h>\n#endif\n' \
		gl/lib/mountlist.c || die

	epatch "${FILESDIR}"/findutils-${PV}-gnulib-mb.patch #576818
	epatch "${FILESDIR}"/findutils-${PV}-gnulib-S_MAGIC_NFS.patch #580032
}

src_configure() {
	use static && append-ldflags -static

	# Avoid conflicting with mlocate binaries at least. See bug 18729
	program_prefix=g
	econf \
		--with-packager="Chris McKinney" \
		--with-packager-version="${PVR}" \
		--program-prefix=${program_prefix} \
		$(use_enable nls) \
		$(use_with selinux) \
		--libexecdir='$(libdir)'/find
}
