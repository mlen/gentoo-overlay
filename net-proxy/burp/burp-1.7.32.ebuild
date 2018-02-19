# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Integrated platform for performing security testing of web applications"
HOMEPAGE="https://portswigger.net/burp/"
SRC_URI="burpsuite_pro_v${PV}.jar"

RESTRICT="fetch"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="virtual/jre
		 virtual/jdk"

src_unpack() {
	mkdir -p "${S}" || die
	cp -L "${DISTDIR}/${A}" "${S}/${PN}.jar" || die
}

src_install() {
	local dir="/opt/${P}"
	insinto "$dir"

	doins "${PN}.jar"
	make_wrapper "${PN}" "java -jar ${dir}/${PN}.jar"
}
