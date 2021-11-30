# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Generic command-line automation tool (no X!)"

HOMEPAGE="https://github.com/ReimuNotMoe/ydotool"
SRC_URI="https://github.com/ReimuNotMoe/ydotool/archive/refs/tags/v0.2.0.tar.gz"
LICENSE="AGPL3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/libevdevplus
		 dev-libs/libuinputplus"

DEPEND="${RDEPEND}
		app-text/scdoc"

RESTRICT=network-sandbox

PATCHES=(
	"${FILESDIR}/96.patch"
)

src_configure() {
	local mycmakeargs=(
		-DCXXOPTS_ENABLE_INSTALL=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	install -Dm644 "${FILESDIR}/80-uinput.rules" "${ED}/etc/udev/rules.d/80-uinput.rules"
}
