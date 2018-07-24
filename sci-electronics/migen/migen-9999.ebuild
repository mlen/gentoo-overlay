# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python3_4 python3_5 python3_6)
inherit distutils-r1

if [ "$PV" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/m-labs/migen.git"
else
	SRC_URI="https://github.com/m-labs/migen/archive/${PV}.tar.gz"
fi

DESCRIPTION="A Python toolbox for building complex digital hardware"
HOMEPAGE="https://m-labs.hk/gateware.html"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

PATCHES=( "${FILESDIR}/python34.patch" )

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
		 dev-python/colorama[${PYTHON_USEDEP}]
		 dev-python/sphinx[${PYTHON_USEDEP}]
		 dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]"
