# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils qmake-utils

DESCRIPTION="Frontend for Cachegrind using Qt"
HOMEPAGE="https://kcachegrind.github.io/"
SRC_URI="http://kcachegrind.sourceforge.net/kcachegrind-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-util/valgrind-3.1
		dev-qt/qtcore:5=
		dev-qt/qtgui:5=
		dev-qt/qtwidgets:5="

RDEPEND="${DEPEND}
		 media-gfx/graphviz"

S="${WORKDIR}/kcachegrind-${PV}"

src_prepare() {
	default
	epatch "${FILESDIR}/qobject.patch"
}

src_configure() {
	eqmake5
}

src_install() {
	dobin qcachegrind/qcachegrind cgview/cgview converters/{dprof,hotshot,memprof,op,pprof}2calltree

	domenu qcachegrind/qcachegrind.desktop

	newicon -s 48 kcachegrind/hi48-app-kcachegrind.png kcachegrind.png
	newicon -s 32 kcachegrind/hi32-app-kcachegrind.png kcachegrind.png
}
