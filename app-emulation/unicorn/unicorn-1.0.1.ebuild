# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 python-utils-r1

DESCRIPTION="Multi-platform, multi-architecture CPU emulator framework"
HOMEPAGE="http://www.unicorn-engine.org/"
SRC_URI="https://github.com/unicorn-engine/unicorn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/python:2.7"
RDEPEND="${DEPEND}"

src_compile() {
	python-single-r1_pkg_setup
	UNICORN_QEMU_FLAGS="--python=${PYTHON}" make
}

src_install() {
	emake DESTDIR="${D}" install
}
