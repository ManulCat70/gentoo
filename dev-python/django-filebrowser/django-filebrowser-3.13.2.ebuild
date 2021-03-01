# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 python3_9 )

inherit distutils-r1

DESCRIPTION="Media-Management with Grappelli."
HOMEPAGE="https://pypi.org/project/${PN}/ https://github.com/sehmaschine/${PN}/"
SRC_URI="https://github.com/sehmaschine/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="
    dev-python/django-grappelli
    dev-python/pillow
    dev-python/six
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

python_prepare() {
	sed -i -e "s/find_packages()/find_packages(exclude=['tests'])/" setup.py || die
}
