# Copyright 1999-2017 Gentoo Foundation
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

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/unicorn-python
		dev-libs/capstone[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-setup.patch"
	default
}
