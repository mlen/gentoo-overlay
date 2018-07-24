# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )
inherit git-r3 mercurial python-any-r1

DESCRIPTION="A framework for Verilog 2005 RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
EGIT_REPO_URI="https://github.com/cliffordwolf/yosys.git"
ABC_REPO_URI="https://github.com/berkeley-abc/abc.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+graphviz +abc tcl"

RDEPEND="sys-libs/readline:=
		 tcl? ( dev-lang/tcl:= )
		 graphviz? ( media-gfx/xdot )"
DEPEND="${RDEPEND}
		${PYTHON_DEPS}
		virtual/pkgconfig
		sys-devel/bison
		sys-devel/flex
		sys-apps/gawk"

src_unpack() {
	git-r3_src_unpack

	if use abc; then
		ABC_COMMIT="$(awk '/^ABCREV/ { print $3 }' "${S}/Makefile")"
		git-r3_fetch "$ABC_REPO_URI" "$ABC_COMMIT" "$ABC_COMMIT"
		git-r3_checkout "$ABC_REPO_URI" "${S}/abc" "$ABC_COMMIT"
	fi
}

src_configure() {
	export PREFIX=/usr

	emake config-gcc
	use tcl || echo "ENABLE_TCL := 0" >> "${S}/Makefile.conf"

	if use abc; then
		echo "ABCPULL := 0" >> "${S}/Makefile.conf"
		echo "ABCREV := default" >> "${S}/Makefile.conf"
	else
		echo "ENABLE_ABC := 0" >> "${S}/Makefile.conf"
	fi
}

src_install() {
	export PREFIX=/usr
	default
}
