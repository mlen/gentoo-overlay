# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 python-utils-r1

DESCRIPTION="Multi-platform, multi-architecture CPU emulator framework"
HOMEPAGE="http://www.unicorn-engine.org/"
SRC_URI="https://github.com/unicorn-engine/unicorn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE_UNICORN_TARGETS="x86 m68k arm aarch64 mips sparc"
use_unicorn_targets=$(printf ' unicorn_targets_%s' ${IUSE_UNICORN_TARGETS})
IUSE+="$(printf ' +%s' ${use_unicorn_targets})"
REQUIRED_USE="|| ( ${use_unicorn_targets} )"

DEPEND="dev-lang/python:2.7"
RDEPEND="${DEPEND}"

src_configure() {
	python-single-r1_pkg_setup

	unicorn_targets=""
	for target in ${IUSE_UNICORN_TARGETS} ; do
		if use "unicorn_targets_${target}"; then
			unicorn_targets+="${target} "
		fi
	done

	if [ -z "${unicorn_targets}" ]; then
		unicorn_targets="${IUSE_UNICORN_TARGETS}"
	fi
}

src_compile() {
	UNICORN_QEMU_FLAGS="--python=${PYTHON}" UNICORN_ARCHS="${unicorn_targets}" UNICORN_STATIC="no" make
}

src_install() {
	emake DESTDIR="${D}" UNICORN_STATIC="no" install
}
