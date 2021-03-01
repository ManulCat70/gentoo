# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} pypy3 )

inherit distutils-r1

IUSE="test"
DESCRIPTION="croniter provides iteration for the datetime object with a cron like format."
HOMEPAGE="
	https://dateutil.readthedocs.org/
	https://pypi.org/project/${PN}
	https://github.com/kiorky/${PN}/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/tox[${PYTHON_USEDEP}]
	)
"

