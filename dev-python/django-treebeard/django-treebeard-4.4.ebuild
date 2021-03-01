# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 python3_9 )

inherit distutils-r1

DESCRIPTION="Efficient tree implementations for Django"
HOMEPAGE="https://pypi.org/project/${PN}/ https://github.com/django-treebeard/${PN}/"
SRC_URI="https://github.com/django-treebeard/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=dev-python/django-2.2"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
