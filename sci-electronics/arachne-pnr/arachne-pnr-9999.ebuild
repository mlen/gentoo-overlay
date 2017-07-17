# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3

DESCRIPTION="Place and route tool for FPGAs"
HOMEPAGE="https://github.com/cseed/arachne-pnr"
EGIT_REPO_URI="https://github.com/cseed/arachne-pnr.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sci-electronics/icestorm"
RDEPEND="${DEPEND}"

src_compile() {
	emake PREFIX=/usr
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}

