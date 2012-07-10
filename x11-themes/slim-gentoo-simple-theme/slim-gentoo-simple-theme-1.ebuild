# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/slim-themes/slim-themes-1.2.3a-r6.ebuild,v 1.4 2012/06/23 20:22:09 lu_zero Exp $

EAPI=2
inherit eutils

DESCRIPTION="SLiM (Simple Login Manager) Gentoo Simple theme"
HOMEPAGE="http://slim.berlios.de"
SRC_URI=" mirror://berlios/slim/slim-gentoo-simple.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="x11-misc/slim"
DEPEND=""

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_compile() {
	:
}

src_install() {
	local themesdir="/usr/share/slim/themes"
	insinto ${themesdir}
	doins -r .
}
