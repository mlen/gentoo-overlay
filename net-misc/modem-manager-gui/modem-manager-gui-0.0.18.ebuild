# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="GUI for Modem Manager daemon."
HOMEPAGE="http://linuxonly.ru/"
SRC_URI="http://download.tuxfamily.org/gsf/source/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=x11-libs/gtk+-3.4.0
	app-text/po4a
	dev-util/itstool
	x11-libs/libnotify"
RDEPEND="${DEPEND}"
