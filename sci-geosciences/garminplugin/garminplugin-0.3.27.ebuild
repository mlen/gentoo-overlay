# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A free replacement for the Garmin browser plugin"
HOMEPAGE="http://www.andreas-diesner.de/garminplugin/"

SRC_URI="https://github.com/adiesner/GarminPlugin/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-geosciences/garmintools[usb]
		sci-geosciences/gpsbabel
		dev-libs/tinyxml[stl]
		virtual/libusb"

RDEPEND="${DEPEND}"

S="${WORKDIR}/GarminPlugin-${PV}/src"

src_install() {
	insinto "/usr/lib64/chromium-browser/"
	doins npGarminPlugin.so
}
