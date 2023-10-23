#! /bin/sh

# - build hare from scratch (according to the hare's home page https://harelang.org/installation/)
# - install everything into /usr/local
# - tested at 2023-10-22
# - method
#   - clone repos
#   - copy repos to a build-<something> directory
#   - build in build-<something>
#   - build directories are not deleted
# 

CLONE=0
BUILD_QBE=1
BUILD_SCDOC=1
BUILD_HAREC=1
BUILD_HARE=1

if [ $CLONE = 1 ]; then
	git clone git://c9x.me/qbe.git
	git clone https://git.sr.ht/~sircmpwn/scdoc
	git clone https://git.sr.ht/~sircmpwn/harec
	git clone https://git.sr.ht/~sircmpwn/hare
 fi

if [ $BUILD_QBE = 1 ]; then
	NAME=qbe
	rm -rf build-$NAME
	cp -pr qbe build-$NAME
	cd build-$NAME

	make PREFIX=/usr/local
	make PREFIX=/usr/local install
fi

if [ $BUILD_SCDOC = 1 ]; then
	NAME=scdoc
	rm -rf build-$NAME
	cp -pr scdoc build-$NAME
	cd build-$NAME

	make PREFIX=/usr/local
	make PREFIX=/usr/local install
fi

if [ $BUILD_HAREC = 1 ]; then
	NAME=harec
	rm -rf build-$NAME
	cp -pr harec build-$NAME
	cd build-$NAME

	mkdir build
	cd build
	../configure --prefix=/usr/local
	make PREFIX=/usr/local
	make check
	make PREFIX=/usr/local install
fi

if [ $BUILD_HARE = 1 ]; then
	NAME=hare
	rm -rf build-$NAME
	cp -pr hare build-$NAME
	cd build-$NAME

	cp config.example.mk config.mk
	# - if you want a cross-compile capable toolchain do the following
	# - install cross binutils (e.g. for debian binutils-aarch64-linux-gnu)
	# - in config.mk set proper values
	#   AARCH64_AS=aarch64-linux-gnu-as
	#   AARCH64_CC=aarch64-linux-gnu-cc
	#   AARCH64_LD=aarch64-linux-gnu-ld
	make
	make install
fi
