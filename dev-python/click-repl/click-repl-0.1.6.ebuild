# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1

DESCRIPTION="Subcommand REPL for click apps."
HOMEPAGE="https://github.com/click-contrib/click-repl https://pypi.org/project/click-repl/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

DOCS=( README.rst )

distutils_enable_tests pytest
