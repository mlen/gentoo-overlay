# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{3,4,5,6}} pypy{,3} )
inherit distutils-r1

DESCRIPTION="A framework for taking care of a bunch of boilerplate in Python apps"
HOMEPAGE="https://pypi.python.org/pypi/scruffington https://github.com/snare/scruffy"
SRC_URI="https://github.com/snare/scruffy/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/scruffy-${PV}"
