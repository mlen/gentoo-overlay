# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_PN="github.com/hashicorp/terraform"

KEYWORDS="~amd64"

if [[ ${PV} == *9999 ]]; then
	inherit golang-vcs
else
	EGIT_COMMIT="v${PV/_/-}"
	SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi

DESCRIPTION="Tool for building, changing, and combining infrastructure"
HOMEPAGE="https://terraform.io/"

LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-go/go-tools:*"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src/${EGO_PN}"

src_compile() {
	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		PATH="$PATH:${WORKDIR}/${P}/bin:$(get_golibdir_gopath)/bin:/usr/lib/go/bin" \
		XC_OS="linux" XC_ARCH="amd64" make bin || die
}

src_install() {
	dodoc README.md CHANGELOG.md
	dobin bin/terraform
}
