# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1

DESCRIPTION="Enable git-like did-you-mean feature in click."
HOMEPAGE="https://github.com/click-contrib/click-didyoumean https://pypi.org/project/click-didyoumean/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

DOCS=( README.rst )

distutils_enable_tests pytest
