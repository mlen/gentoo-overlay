# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24"

inherit multilib ruby-fakegem

DESCRIPTION="Provide powerful tools for seccomp analysis"
HOMEPAGE="https://github.com/david942j/seccomp-tools"
SRC_URI="https://github.com/david942j/seccomp-tools/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

each_ruby_configure() {
	${RUBY} -Cext/ptrace extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/ptrace V=1
	cp ext/ptrace/ptrace$(get_modname) lib/seccomp-tools/ || die
}
