#!/usr/bin/env bash
# script to initialise meson build tree for some of the libopencm3 libraries.


# do everything from the top directory of the repo
REPO_ROOT_DIR=$(git rev-parse --show-toplevel)
cd $REPO_ROOT_DIR

MESON_BUILD_DIR="./meson_bld"
if [ ! -d $MESON_BUILD_DIR ]
then
    mkdir -p $MESON_BUILD_DIR
    meson $MESON_BUILD_DIR --cross-file=meson/crossfile.txt
fi
