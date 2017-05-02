# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Fast Verilog HDL simulator that compiles Verilog into C++ or SystemC"
HOMEPAGE="http://www.veripool.org/wiki/verilator"
SRC_URI="http://www.veripool.org/ftp/${P}.tgz"

LICENSE="|| ( LGPL-3 Artistic-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="sys-devel/flex
	sys-devel/bison
	dev-lang/perl
	test? ( sys-devel/gdb )"
RDEPEND="dev-lang/perl"

DOCS="Changes README TODO"
HTML_DOCS="internals.html verilator.html"
