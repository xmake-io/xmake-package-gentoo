# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit optfeature

DESCRIPTION="A cross-platform build utility based on Lua."
HOMEPAGE="https://xmake.io"
SRC_URI="https://github.com/xmake-io/xmake/releases/download/v${PV}/xmake-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/pkgconfig"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
S="${WORKDIR}"

src_compile() {
	emake build
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
}

pkg_postinst() {
	optfeature "cached compilation for your xmake projects" dev-util/ccache
}
