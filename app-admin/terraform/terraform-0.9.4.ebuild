# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_PN="github.com/hashicorp/terraform"

EGO_VENDOR=(
	"github.com/mitchellh/gox v0.4.0"
	"github.com/mitchellh/iochan 87b45ffd0e9581375c491fef3d32130bb15c5bd7"
)

inherit golang-build golang-vcs-snapshot

KEYWORDS="~amd64"

SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		 ${EGO_VENDOR_URI}"

DESCRIPTION="Tool for building, changing, and combining infrastructure"
HOMEPAGE="https://terraform.io/"

LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-go/go-tools:*"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)"

	(cd ./vendor/github.com/mitchellh/gox && go build -o "${WORKDIR}/${P}/bin/gox") || die "gox build failure"

	PATH="${PATH}:${WORKDIR}/${P}/bin:$(get_golibdir_gopath)/bin:/usr/lib/go/bin" \
		XC_OS="linux" XC_ARCH="amd64" make bin || die "build failed"
}

src_install() {
	dodoc README.md CHANGELOG.md
	dobin bin/terraform
}
