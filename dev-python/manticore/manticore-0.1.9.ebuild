# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 eutils

DESCRIPTION="Dynamic binary analysis tool"
HOMEPAGE="https://github.com/trailofbits/manticore"
SRC_URI="https://github.com/trailofbits/manticore/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/unicorn-python[${PYTHON_USEDEP}]
		dev-python/pyelftools[${PYTHON_USEDEP}]
		dev-python/ply[${PYTHON_USEDEP}]
		dev-python/pysha3[${PYTHON_USEDEP}]
		>=dev-libs/capstone-3.0.5_rc2[${PYTHON_USEDEP}]
		sci-mathematics/z3[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-setup.patch"
	default
}
