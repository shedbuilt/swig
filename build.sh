#!/bin/bash
./configure --prefix=/usr                      \
            --without-clisp                    \
            --without-maximum-compile-warnings
make -j $SHED_NUMJOBS
make DESTDIR=${SHED_FAKEROOT} install
install -v -m755 -d ${SHED_FAKEROOT}/usr/share/doc/swig-3.0.12
cp -v -R Doc/* ${SHED_FAKEROOT}/usr/share/doc/swig-3.0.12
