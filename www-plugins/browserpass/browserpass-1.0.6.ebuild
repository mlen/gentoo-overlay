# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/dannyvankooten/${PN}"
EGIT_COMMIT=${PV}

inherit golang-vcs-snapshot

DESCRIPTION="Chrome & Firefox browser extension for pass"
HOMEPAGE="https://github.com/dannyvankooten/browserpass"
SRC_URI="https://${REPO}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+chromium firefox google-chrome"

DEPEND=""
RDEPEND="app-admin/pass
		 google-chrome? ( www-client/google-chrome )
		 chromium? ( www-client/chromium )
		 firefox? ( www-client/firefox )"

S="$WORKDIR/${P}/src/${EGO_PN}"

src_prepare() {
	default

	sed -e 's|%%replace%%|/usr/bin/browserpass|' chrome/host.json > chrome/com.dannyvankooten.browserpass.json || die
	sed -e 's|%%replace%%|/usr/bin/browserpass|' firefox/host.json > firefox/com.dannyvankooten.browserpass.json || die
}

src_compile() {
	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" go build -o "bin/browserpass" "${EGO_PN}/cmd/browserpass" || die
}

src_install() {
	dobin bin/browserpass

	if use chromium; then
		insinto /etc/chromium/native-messaging-hosts/
		doins "chrome/com.dannyvankooten.browserpass.json"
	fi

	if use google-chrome; then
		insinto /etc/opt/chrome/native-messaging-hosts/
		doins "chrome/com.dannyvankooten.browserpass.json"
	fi

	if use firefox; then
		insinto /usr/lib64/mozilla/native-messaging-hosts/
		doins "firefox/com.dannyvankooten.browserpass.json"
	fi
}

pkg_postinst() {
	elog "To use Browserpass, don't forget to install the extention to your browser:"
	elog "- https://chrome.google.com/webstore/detail/browserpass/jegbgfamcgeocbfeebacnkociplhmfbk"
	elog "- https://addons.mozilla.org/en-US/firefox/addon/browserpass/"
}
