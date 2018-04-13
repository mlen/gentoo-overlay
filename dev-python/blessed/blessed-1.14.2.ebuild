# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

DESCRIPTION="Practical wrapper around terminal styling, screen positioning and keyboard input"
HOMEPAGE="https://pypi.python.org/pypi/blessed https://github.com/jquast/blessed"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/wcwidth[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
