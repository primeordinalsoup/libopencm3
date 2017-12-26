#!/usr/bin/env bash
# script to initialise meson build tree for some of the libopencm3 libraries.

# do everything from the top directory of the repo
REPO_ROOT_DIR=$(git rev-parse --show-toplevel)
cd $REPO_ROOT_DIR

MESON_BUILD_DIR="./meson_bld"
if [ ! -d $MESON_BUILD_DIR ]
then
    echo "${MESON_BUILD_DIR} does not exist yet! Running ./meson/setupmeson.sh first"
    ./meson/setupmeson.sh
fi

# meson build tree is initialised, do the ninja build on it.
ninja -C $MESON_BUILD_DIR
