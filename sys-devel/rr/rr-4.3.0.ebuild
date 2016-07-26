# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Record and Replay Framework"
HOMEPAGE="http://rr-project.org/"
SRC_URI="https://github.com/mozilla/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-libs/zlib
		sys-libs/glibc
		sys-devel/gcc"

RDEPEND="${DEPEND}"

src_prepare() {
	default

	# remove cmake wrapper
	rm configure

	# fails to build with -Werror
	sed -i 's/-Werror//' CMakeLists.txt
}
