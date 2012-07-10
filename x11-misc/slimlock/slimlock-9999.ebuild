# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 toolchain-funcs

EGIT_REPO_URI="git://github.com/Hypnos7/slimlock.git"
DESCRIPTION="screen locker borrowing the interface of the SLiM login-manager"
HOMEPAGE="http://joelburget.com/slimlock/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXft
	media-libs/freetype
	media-libs/imlib2
	virtual/pam
	dev-util/pkgconfig"
RDEPEND="$DEPEND
	x11-misc/slim[pam]"

#src_prepare() {
#	sed -i \
#		-e "s/LDFLAGS=\(.*\)/LIBS=\1/" \
#		-e "s/-o \$(NAME)/-o \$(NAME) \$(LIBS)/" \
#		-e "/MANDIR/d" \
#		-e "s/CFLAGS=/MYCFLAGS=/" \
#		-e "s/\$(CFLAGS)/\$(CFLAGS) \$(MYCFLAGS)/" \
#		Makefile || die "sed failed"
#}

src_compile() {
	emake	CC=$(tc-getCC) \
		CXX=$(tc-getCXX) \
		VERSION=${PV} \
		PREFIX="${EPREFIX}"/usr \
		CFGDIR="${EPREFIX}"/etc
}

src_install() {
	default_src_install
	doman ${PN}.1
}
