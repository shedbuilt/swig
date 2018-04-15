#!/bin/bash
./configure --prefix=/usr                      \
            --without-clisp                    \
            --without-maximum-compile-warnings
make -j $SHED_NUM_JOBS
make DESTDIR=${SHED_FAKE_ROOT} install
install -v -m755 -d ${SHED_FAKE_ROOT}/usr/share/doc/swig-3.0.12
cp -v -R Doc/* ${SHED_FAKE_ROOT}/usr/share/doc/swig-3.0.12
