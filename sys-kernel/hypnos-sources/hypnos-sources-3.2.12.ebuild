# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/gentoo-sources/gentoo-sources-3.2.12.ebuild,v 1.5 2012/04/15 20:32:05 jdhore Exp $

EAPI="3"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="12"
K_DEBLOB_AVAILABLE="1"
inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha amd64 arm hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc x86"
HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches http://www.tuxonice.net http://crow202.org/tuxonice/"
IUSE="deblob"

DESCRIPTION="Up-to-date Gentoo + TuxOnIce patchset"
TUX_BASE="tuxonice-${PV}.patch.bz2"
TUX_URI="http://crow202.org/tuxonice/${TUX_BASE}"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${TUX_URI}"

RDEPEND="${RDEPEND}
	>=sys-apps/tuxonice-userui-1.0
	|| ( >=sys-power/hibernate-script-2.0 sys-power/pm-utils )"


UNIPATCH_LIST="${DISTDIR}/${TUX_BASE}"
UNIPATCH_STRICTORDER="yes"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
