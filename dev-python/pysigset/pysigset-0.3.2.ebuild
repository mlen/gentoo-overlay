# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} pypy )
inherit distutils-r1

DESCRIPTION="Python blocking/suspending signals using ctypes sigprocmask access"
HOMEPAGE="https://pypi.python.org/pypi/pysigset https://github.com/ossobv/pysigset"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"