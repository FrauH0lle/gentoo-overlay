# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Arc KDE customization"
HOMEPAGE="https://github.com/PapirusDevelopmentTeam/arc-kde/"
inherit git-r3
EGIT_REPO_URI="https://github.com/PapirusDevelopmentTeam/${PN}.git"
LICENSE="GPL-3+ wallpapers? ( CC-BY-SA-4.0 )"
SLOT="0"
KEYWORDS="amd64"
MY_COMPONENTS=(konversation yakuake)
IUSE="${MY_COMPONENTS[*]/+}"
REQUIRED_USE="|| ( ${MY_COMPONENTS[*]/+} )"
RESTRICT="primaryuri"

RDEPEND="x11-themes/kvantum"

src_install() {
	einstalldocs

	local -r themes=(
		aurorae
		color-schemes
		konsole
		$(usev konversation)
		Kvantum
		plasma
		wallpapers
		$(usev yakuake)
	)

	emake DESTDIR="${ED}" THEMES="${themes[*]}" install

	find "${ED}/usr/share" \( -name "AUTHORS" -o -name "LICENSE" \) -delete \
		|| die "the cleaning has failed"
}
