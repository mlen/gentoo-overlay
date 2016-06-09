# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/texane/${PN}.git https://github.com/texane/${PN}.git"
else
	SRC_URI="https://github.com/texane/${PN}/archive/${PV}/${P}.tar.gz"
fi

DESCRIPTION="stm32 discovery line linux programmer"
HOMEPAGE="https://github.com/texane/stlink"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/pkgconfig
virtual/libusb"

RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf || die
}
