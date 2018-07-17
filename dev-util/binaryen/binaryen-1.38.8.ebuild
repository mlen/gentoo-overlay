# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7)

inherit cmake-utils python-any-r1

if [ "${PV}" != 9999 ]; then
	SRC_URI="https://github.com/WebAssembly/binaryen/archive/${PV}.tar.gz -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://github.com/WebAssembly/binaryen.git"
	inherit git-r3
fi

DESCRIPTION="Compiler infrastructure and toolchain library for WebAssembly"
HOMEPAGE="https://github.com/WebAssembly/binaryen"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"
DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_WERROR=OFF
	)

	cmake-utils_src_configure
}
