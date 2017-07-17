# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Place and route tool for FPGAs"
HOMEPAGE="https://github.com/cseed/arachne-pnr"
EGIT_REPO_URI="https://github.com/cseed/arachne-pnr.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sci-electronics/icestorm
		dev-vcs/git"
RDEPEND="${DEPEND}"

src_compile() {
	export PREFIX=/usr
	default
}

src_install() {
	export PREFIX=/usr
	default
}
