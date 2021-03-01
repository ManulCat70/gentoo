# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Developer-friendly asynchrony for Django"
HOMEPAGE="https://channels.readthedocs.io/ https://pypi.org/project/channels/"
SRC_URI="https://github.com/django/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/django[${PYTHON_USEDEP}]
"
BDEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		$(python_gen_impl_dep sqlite)
		${RDEPEND}
		dev-python/docutils[${PYTHON_USEDEP}]
		dev-python/jinja[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[webp,${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/selenium[${PYTHON_USEDEP}]
		dev-python/tblib[${PYTHON_USEDEP}]
		<sys-devel/gettext-0.21
	)"

distutils_enable_sphinx docs --no-autodoc

python_test() {
	# Tests have non-standard assumptions about PYTHONPATH,
	# and don't work with ${BUILD_DIR}/lib.
	PYTHONPATH=. "${EPYTHON}" tests/runtests.py --settings=test_sqlite -v2 ||
		die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
}

