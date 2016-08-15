# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="CFR - Another Java Decompiler"
HOMEPAGE="http://www.benf.org/other/cfr/"
SRC_URI="http://www.benf.org/other/cfr/cfr_${PV/./_}.jar -> ${P}.jar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="virtual/jre
		 virtual/jdk"

src_unpack() {
	mkdir -p "${S}" || die
    cp -L ${DISTDIR}/${A} ${S}/${PN}.jar || die
}

src_install() {
	local dir="/opt/${P}"
	insinto "$dir"

	doins "${PN}.jar"
	make_wrapper "${PN}" "java -jar ${dir}/${PN}.jar" "${dir}"
}
