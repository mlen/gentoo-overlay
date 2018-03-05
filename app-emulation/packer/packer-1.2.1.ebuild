# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_PN="github.com/hashicorp/packer"

KEYWORDS="~amd64"

if [[ ${PV} == *9999 ]]; then
	inherit golang-vcs
else
	EGIT_COMMIT="v${PV/_/-}"
	SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi

DESCRIPTION="Tool for creating machine images"
HOMEPAGE="https://packer.io/"

LICENSE="MPL-2.0"
SLOT="0"
IUSE="zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}
		 zsh-completion? ( app-shells/zsh )"

S="${WORKDIR}/${P}/src/${EGO_PN}"

src_compile() {
	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" go build -o "bin/packer" || die
}

src_install() {
	dodoc README.md CHANGELOG.md
	dobin bin/packer

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins contrib/zsh-completion/_*
	fi
}
