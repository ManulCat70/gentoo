# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 python3_8 python3_9 )

inherit distutils-r1

DESCRIPTION="Domain-driven e-commerce for Django"
HOMEPAGE="
	https://pypi.org/project/${PN}/
	https://github.com/${PN}/${PN}/"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/django-3.0[${PYTHON_USEDEP}]
	dev-python/pycountry[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/django-widget-tweaks[${PYTHON_USEDEP}]
	dev-python/django-extra-views[${PYTHON_USEDEP}]
	dev-python/django-treebeard[${PYTHON_USEDEP}]
	dev-python/django-haystack[${PYTHON_USEDEP}]
	dev-python/Babel[${PYTHON_USEDEP}]
	dev-python/purl[${PYTHON_USEDEP}]
	dev-python/django-phonenumber-field[${PYTHON_USEDEP}]
	dev-python/django-tables2[${PYTHON_USEDEP}]
	dev-python/easy-thumbnails[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		$(python_gen_impl_dep sqlite)
		${RDEPEND}
	)
"

distutils_enable_sphinx docs

python_prepare_all() {
	# This prevents distutils from installing 'tests' package, rm magic no more needed
	sed -e "/find_packages/s:'tests':'tests.\*', 'tests':" -i setup.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	emake test
}

