# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

MY_PN="unicorn"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Multi-platform, multi-architecture CPU emulator framework"
HOMEPAGE="http://www.unicorn-engine.org/"
SRC_URI="https://github.com/unicorn-engine/unicorn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="=app-emulation/${MY_PN}-${PVR}"

S="${WORKDIR}/${MY_P//_/-}/bindings/python"
