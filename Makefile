.PHONY: default

default: packages/v0.6/REQUIRE setup.sh

packages/v0.6/REQUIRE: REQUIRE packages/v0.6
	rm packages/v0.6/REQUIRE
	ln -s ../../REQUIRE packages/v0.6/REQUIRE
	JULIA_PKGDIR="`pwd`/packages" julia -e "Pkg.update()"

packages/v0.6: 
	mkdir -p packages
	JULIA_PKGDIR="`pwd`/packages" julia -e "Pkg.init()"

setup.sh:
	echo "export JULIA_PKGDIR=\"`pwd`/packages\"" > setup.sh
	echo "echo \"JULIA_PKGDIR set to `pwd`/packages\"" >> setup.sh
	echo 'export JULIA_LOAD_PATH="$$JULIA_LOAD_PATH'":`pwd`/submodules\"" >> setup.sh
	echo "echo \"JULIA_LOAD_PATH added `pwd`/submodules\"" >> setup.sh
	