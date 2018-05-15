# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Python bindings for Valgrind's VEX IR"
HOMEPAGE="https://pypi.python.org/pypi/pyvex https://github.com/angr/pyvex"
VEX_SNAPSHOT="b08ff6739a29b0ca3a8218ec7516513dca978ce9"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/archinfo[${PYTHON_USEDEP}]
		dev-python/pycparser[${PYTHON_USEDEP}]
		dev-python/cffi[${PYTHON_USEDEP}]
		dev-python/bitstring[${PYTHON_USEDEP}]
		dev-python/future[${PYTHON_USEDEP}]
		dev-util/valgrind"

RDEPEND="${DEPEND}"
