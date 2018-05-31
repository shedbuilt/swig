#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
SHED_PKG_LOCAL_DOCDIR="/usr/share/doc/${SHED_PKG_NAME}-${SHED_PKG_VERSION}"
# Configure
./configure --prefix=/usr                      \
            --without-clisp                    \
            --without-maximum-compile-warnings &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
# Install Documentation
if [ -n "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    install -vdm755 "${SHED_FAKE_ROOT}${SHED_PKG_LOCAL_DOCDIR}" &&
    cp -v -R Doc/* "${SHED_FAKE_ROOT}${SHED_PKG_LOCAL_DOCDIR}"
fi
