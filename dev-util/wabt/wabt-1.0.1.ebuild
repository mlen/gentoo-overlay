# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6,7}} )

inherit cmake-utils python-any-r1

if [ "${PV}" != 9999 ]; then
	SRC_URI="https://github.com/WebAssembly/wabt/archive/${PV}.tar.gz -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://github.com/WebAssembly/wabt.git"
	inherit git-r3
fi

DESCRIPTION="The WebAssembly Binary Toolkit"
HOMEPAGE="https://github.com/WebAssembly/wabt"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"
DEPEND="dev-util/re2c
		${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=OFF
	)

	cmake-utils_src_configure
}
