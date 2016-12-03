# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

EGIT_REPO_URI="git://github.com/solvespace/${PN}.git https://github.com/solvespace/${PN}.git"
EGIT_SUBMODULES=("extlib/libdxfrw")
if [ "${PV}" != "9999" ]; then
	EGIT_COMMIT="${PV}"
fi

DESCRIPTION="Parametric 2d/3d CAD"
HOMEPAGE="http://solvespace.com"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/zlib
dev-libs/json-c
dev-cpp/gtkmm:2.4
dev-cpp/pangomm
media-libs/libpng
media-libs/freetype
media-libs/fontconfig
media-libs/glew
media-libs/glu
media-libs/mesa"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=("-DENABLE_TESTS=OFF")
	cmake-utils_src_configure
}
