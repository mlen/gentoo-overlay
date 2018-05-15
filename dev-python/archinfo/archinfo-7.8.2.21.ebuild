# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Classes with architecture-specific information useful to other projects"
HOMEPAGE="https://pypi.python.org/pypi/archinfo https://github.com/angr/archinfo"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND="${DEPEND}"
