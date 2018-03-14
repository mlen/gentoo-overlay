# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-vcs-snapshot golang-build

EGO_PN="github.com/coreos/terraform-provider-ct"
DESCRIPTION="Terraform provider for Container Linux Configs"
HOMEPAGE="https://github.com/coreos/terraform-provider-ct"
SRC_URI="https://${EGO_PN}/archive/v0.2.1.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_install() {
	dobin terraform-provider-ct
}
