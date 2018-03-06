# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

MY_PN="NotoEmoji"
MY_PV="2018-01-02-flag-update"
SRC_URI="https://github.com/googlei18n/noto-emoji/archive/v${MY_PV}.tar.gz"

DESCRIPTION="Color and Black-and-White Noto Emoji fonts by Google"
HOMEPAGE="https://github.com/googlei18n/noto-emoji"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""

S="${WORKDIR}"
RESTRICT="binchecks strip mirror"

FONT_SUFFIX="ttf"
FONT_S="${S}/noto-emoji-${MY_PV}/fonts"
