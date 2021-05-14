# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A cross-platform build utility based on Lua."
HOMEPAGE="https://xmake.io"
SRC_URI="https://github.com/xmake-io/xmake/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
         https://github.com/xmake-io/xmake-core-lua-cjson/archive/515bab6d6d80b164b94db73af69609ea02f3a798.tar.gz -> ${P}-ext_core-lua-cjson.tar.gz
		 https://github.com/xmake-io/xmake-core-luajit/archive/e9af1abec542e6f9851ff2368e7f196b6382a44c.tar.gz -> ${P}-ext_core-luajit.tar.gz
		 https://github.com/xmake-io/xmake-core-sv/archive/9a3cf7c8e589de4f70378824329882c4a047fffc.tar.gz -> ${P}-ext_core-sv.tar.gz
		 https://github.com/tboox/tbox/archive/6e5fb77c5ab5c0d712871c52c42a5bc7843cd780.tar.gz -> ${P}-ext_tboox-tboox.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-util/ccache dev-vcs/git virtual/pkgconfig"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_unpack() {
	unpack "${P}.tar.gz"
	cd "${S}" || die "Could not change into the working directory."

	tar xf "${DISTDIR}/${P}-ext_core-lua-cjson.tar.gz" --strip-components 1 -C core/src/lua-cjson/lua-cjson || die "Failed to unpack ${P}-ext_core-lua-cjson.tar.gz"
	tar xf "${DISTDIR}/${P}-ext_core-luajit.tar.gz" --strip-components 1 -C core/src/luajit/luajit || die "Failed to unpack ${P}-ext_core-luajit.tar.gz"
	tar xf "${DISTDIR}/${P}-ext_core-sv.tar.gz" --strip-components 1 -C core/src/sv/sv || die "Failed to unpack ${P}-ext_core-sv.tar.gz"
	tar xf "${DISTDIR}/${P}-ext_tboox-tboox.tar.gz" --strip-components 1 -C core/src/tbox/tbox || die "Failed to unpack ${P}-ext_tboox-tboox.tar.gz"
}

src_compile() {
	emake build
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
}
