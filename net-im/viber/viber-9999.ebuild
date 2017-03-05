# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

DESCRIPTION="Free calls, text and picture sharing"
HOMEPAGE="https://viber.com"
SRC_URI="http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="strip"
S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}
         app-arch/bzip2
         dev-libs/expat
         dev-libs/glib
         dev-libs/icu
         dev-libs/libbsd
         dev-libs/libffi
         dev-libs/libpcre
         dev-libs/libxml2
         dev-libs/libxslt
         dev-libs/nspr
         dev-libs/nss
         media-libs/alsa-lib
         media-libs/flac
         media-libs/fontconfig
         media-libs/freetype
         media-libs/libogg
         media-libs/libpng
         media-libs/libsndfile
         media-libs/libvorbis
         media-libs/mesa
         media-sound/pulseaudio
         net-libs/libasyncns
         sys-apps/dbus
         sys-apps/tcp-wrappers
         sys-libs/zlib
         x11-libs/libdrm
         x11-libs/libICE
         x11-libs/libSM
         x11-libs/libX11"

src_install() {
    doins -r opt usr
}
