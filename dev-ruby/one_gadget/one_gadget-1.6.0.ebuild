# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="The best tool for finding one gadget RCE in libc.so.6"
HOMEPAGE="https://github.com/david942j/one_gadget"
SRC_URI="https://github.com/david942j/one_gadget/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

ruby_add_rdepend "dev-ruby/elftools:*"
