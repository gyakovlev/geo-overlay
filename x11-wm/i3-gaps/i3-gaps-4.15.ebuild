# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="i3 with more features"
HOMEPAGE="https://github.com/Airblader/i3"
SRC_URI="https://github.com/Airblader/i3/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}"/i3-"${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc debug test"

CDEPEND="!x11-wm/i3
	dev-libs/libev
	dev-libs/libpcre
	>=dev-libs/yajl-2.0.3
	x11-libs/libxcb[xkb]
	x11-libs/libxkbcommon[X]
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
	>=x11-libs/cairo-1.14.4[X,xcb]
	>=x11-libs/pango-1.30.0[X]"
DEPEND="${CDEPEND}
	app-text/asciidoc
	doc? ( app-text/xmlto dev-lang/perl )
	test? (
		dev-perl/Module-Install
	)
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS"

# Test without debug will apply optimization levels, which results
# in type-punned pointers - which in turn causes test failures.
REQUIRED_USE="test? ( debug )"

DOCS=(
	"RELEASE-NOTES-${PV}"
	docs
)
PATCHES=(
	"${FILESDIR}/${PN}-musl-GLOB_TILDE.patch"
)

src_test() {
	emake -C "${CBUILD}" check
}

src_prepare() {
	default

	cat <<- EOF > "${T}"/i3wm
		#!/bin/sh
		exec /usr/bin/i3
	EOF

	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable debug)
	)
	econf "${myeconfargs[@]}"
}

src_compile() {
	emake -C "${CBUILD}"
}

src_install() {
	emake -C "${CBUILD}" DESTDIR="${D}" install
	doman "${CBUILD}"/man/*.1

	use doc && einstalldocs

	exeinto /etc/X11/Sessions
	doexe "${T}/i3wm"
}

pkg_postinst() {
	einfo "There are several packages that you may find useful with ${PN} and"
	einfo "their usage is suggested by the upstream maintainers, namely:"
	einfo "  x11-misc/dmenu"
	einfo "  x11-misc/i3status"
	einfo "  x11-misc/i3lock"
	einfo "Please refer to their description for additional info."
}
