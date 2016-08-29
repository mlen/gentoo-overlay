# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A light-weight process isolation tool, making use of Linux namespaces and seccomp-bpf syscall filters"
HOMEPAGE="http://google.github.io/nsjail/"
SRC_URI="https://github.com/google/nsjail/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin nsjail
	dodoc README.md
}
