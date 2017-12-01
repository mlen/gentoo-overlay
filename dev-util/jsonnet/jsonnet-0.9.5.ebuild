# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Domain specific configuration language that helps defining JSON data"
HOMEPAGE="http://jsonnet.org/"
SRC_URI="https://github.com/google/jsonnet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's/FLAGS ?= -g $(OPT)/+= /' Makefile || die "Failed to patch Makefile"
}

src_install() {
	dobin jsonnet
}
