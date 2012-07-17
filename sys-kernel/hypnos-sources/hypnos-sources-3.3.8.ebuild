# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="9"
K_DEBLOB_AVAILABLE="1"
inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
TUX_HOMEPAGE="http://github.com/NigelCunningham/tuxonice-kernel"
HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches http://www.tuxonice.net ${TUX_HOMEPAGE}"
IUSE="deblob"

DESCRIPTION="Up-to-date Gentoo + TuxOnIce patchset"
TUX_PATCH="tuxonice-${PV}.patch"
TUX_URI="${TUX_HOMEPAGE}/compare/845720650c...759e627.diff"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${TUX_URI} -> ${TUX_PATCH}"

RDEPEND="${RDEPEND}
	>=sys-apps/tuxonice-userui-1.0
	|| ( >=sys-power/hibernate-script-2.0 sys-power/pm-utils )"


UNIPATCH_LIST="${DISTDIR}/${TUX_PATCH}"
UNIPATCH_STRICTORDER="yes"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
