# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A framework for Verilog 2005 RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
EGIT_REPO_URI="https://github.com/cliffordwolf/yosys.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+graphviz tcl"

RDEPEND="sys-libs/readline:=
		 tcl? ( dev-lang/tcl:= )
		 graphviz? ( media-gfx/xdot )"
DEPEND="${RDEPEND}
		virtual/pkgconfig
		sys-devel/bison
		sys-devel/flex
		sys-apps/gawk"

src_configure() {
	export PREFIX=/usr

	emake config-gcc
	echo "ENABLE_ABC := 0" >> "${S}/Makefile.conf"
	use tcl || echo "ENABLE_TCL := 0" >> "${S}/Makefile.conf"
}

src_install() {
	export PREFIX=/usr
	default
}
