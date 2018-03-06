# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

MY_PN="NotoEmoji"
MY_PV="v2018-01-02-flag-update"
GITHUB_URI="https://raw.githubusercontent.com/googlei18n/noto-emoji/${MY_PV}"

DESCRIPTION="Color and Black-and-White Noto Emoji fonts by Google"
HOMEPAGE="https://github.com/googlei18n/noto-emoji"

SRC_URI="
	${GITHUB_URI}/fonts/NotoColorEmoji.ttf		-> ${P}-Color.ttf
	${GITHUB_URI}/fonts/NotoEmoji-Regular.ttf	-> ${P}-Regular.ttf
"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""

S=${WORKDIR}
RESTRICT="mirror"

FONT_SUFFIX="ttf"
FONT_S=${S}

src_unpack() {
	local fontfile newname docfile

	for fontfile in "${DISTDIR}"/*."${FONT_SUFFIX}" ; do
		newname=$(basename "${fontfile}")
		newname=${newname/"${P}"/"${MY_PN}"}
		cp "${fontfile}" "${FONT_S}/${newname}"
	done
}
