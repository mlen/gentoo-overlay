# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="kubectl controls the Kubernetes cluster manager"
HOMEPAGE="http://kubernetes.io/"
SRC_URI="https://storage.googleapis.com/kubernetes-release/release/v${PV}/bin/linux/amd64/kubectl -> kubectl-${PV}"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "${S}"
	cp "${DISTDIR}/${A}" "${S}/kubectl" || die
}

src_install() {
	dobin kubectl
}
