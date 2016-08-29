# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Tools to work with android .dex and java .class files"
HOMEPAGE="https://github.com/pxb1988/dex2jar"
SRC_URI="https://github.com/pxb1988/dex2jar/releases/download/2.0/dex-tools-${PV}.zip -> ${P}.zip"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="virtual/jre
		 virtual/jdk"

src_prepare() {
	default
	rm *.bat
	chmod a+x *.sh
}

src_install() {
	local dir="/opt/${P}"
	dodir /opt/"${P}"
	cp -R "${S}"/* "${D}/${dir}" || die "Install failed!"

	make_wrapper "dex2jar" "${dir}/d2j-dex2jar.sh"
}
