# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Wallpaper setting utility for X"
HOMEPAGE="https://github.com/stoeckmann/xwallpaper"

if [ ${PV} == "9999" ] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/stoeckmann/${PN}.git"
else
	SRC_URI="https://github.com/stoeckmann/${PN}/releases/download/v${PV}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="ISC"
SLOT="0"
IUSE="jpeg png seccomp xpm"

DEPEND="
		>=x11-libs/pixman-0.32
		>=x11-libs/xcb-util-0.3.8
		>=x11-libs/xcb-util-image-0.3.8
		jpeg? ( virtual/jpeg:0= )
		png? ( >=media-libs/libpng-1.2:= )
		seccomp? ( >=sys-libs/libseccomp-2.3.1:0= )
		xpm? ( >=x11-libs/libXpm-3.5 )"

RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
src_configure() {
	econf \
		$(use_with jpeg) \
		$(use_with png) \
		$(use_with seccomp) \
		$(use_with xpm) \
		--with-randr \
		--with-zshcompletiondir="${EPREFIX}/usr/share/zsh/site-functions"
}
