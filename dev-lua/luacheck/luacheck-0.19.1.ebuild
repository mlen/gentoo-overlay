# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="A tool for linting and static analysis of Lua code"
HOMEPAGE="https://github.com/mpeterv/luacheck"
SRC_URI="https://github.com/mpeterv/luacheck/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND=">=dev-lang/lua-5.1:="
DEPEND="${COMMON_DEPEND}
		virtual/pkgconfig"

RDEPEND="${COMMON_DEPEND}
		 dev-lua/luafilesystem
		 dev-lua/lanes"

src_install() {
	insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD lua)"
	doins -r src/luacheck
	newbin bin/luacheck.lua luacheck
}
