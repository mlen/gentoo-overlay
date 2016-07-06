# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

LICENSE="GPL-2"

DESCRIPTION="A Linux interface to the Garmin GPS units"
HOMEPAGE="http://code.google.com/p/garmintools/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="usb"

DEPEND="usb? ( virtual/libusb )"
RDEPEND="${DEPEND}"
