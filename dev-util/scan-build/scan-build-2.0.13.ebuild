# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} pypy{,3} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="Clang's scan-build re-implementation in python"
HOMEPAGE="https://pypi.python.org/pypi/scan-build https://github.com/rizsotto/scan-build"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/typing[${PYTHON_USEDEP}]"

RDEPEND="${DEPEND}"
