# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Light-weight process isolation tool using Linux namespaces and seccomp-bpf"
HOMEPAGE="https://github.com/google/nsjail"

EGIT_REPO_URI="https://github.com/google/${PN}.git"
EGIT_SUBMODULES=("kafel")

if [[ "${PV}" != "9999" ]]; then
	EGIT_COMMIT="${PV}"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dodoc README.md
	dobin nsjail
}
