# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24"

RUBY_S="rbelftools-${PV}"

inherit ruby-fakegem

DESCRIPTION="ELF parser library implemented in pure Ruby!"
HOMEPAGE="https://github.com/david942j/rbelftools"
SRC_URI="https://github.com/david942j/rbelftools/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

ruby_add_rdepend "dev-ruby/bindata:*"
