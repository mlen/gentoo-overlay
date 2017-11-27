# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Warsaw Hackerspace Misery Fortunes"
HOMEPAGE="https://hackerspace.pl"
SRC_URI="http://oodviewer.q3k.me/term.json/_, -> ${P}.json"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="games-misc/fortune-mod"
DEPEND="${RDEPEND}
		app-misc/jq"

S="${WORKDIR}"

src_prepare() {
	cp "${DISTDIR}/${A}" "${S}/misery.json" || die
	default
}

src_compile() {
	jq -r '.[] | "\(.entry)\n \(.author), \(.added | tonumber | gmtime | strftime("%Y/%m/%d"))\n%"' <misery.json >misery || die
	strfile misery misery.dat || die
}

src_install() {
	insinto /usr/share/fortune
	doins misery{,.dat}
}
