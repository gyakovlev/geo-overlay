# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 linux-mod

DESCRIPTION="Linux Driver for ITE LPC chips"
HOMEPAGE="https://github.com/groeck/it87"

EGIT_REPO_URI="https://github.com/groeck/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
IUSE="doc"

CONFIG_CHECK="HWMON ~!CONFIG_SENSORS_IT87"

MODULE_NAMES="it87(misc:${S})"
BUILD_TARGETS="modules"

src_prepare() {
	eapply_user
	sed -i 's@^KERNEL_BUILD.*@KERNEL_BUILD := $(KERNEL_MODULES)/build@' "${S}/Makefile" || die "Could not fix build path"
}