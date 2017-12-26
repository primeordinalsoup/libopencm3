#!/usr/bin/env bash
# wrapper script to call python generator on meson's behalf.
# needed as the python script needs to be called from a specific
# cwd and with exactly correct relative path arguments, and meson
# does not support that dircectly (does it?)
# call with two args:
#  full path to directory to run irq2nvic_h script (is repo root directory)
#  relative path to the json file used to generate the irq files

RUN_DIR=$1
JSON="./include/${2##*include/}"    # strip off leading '../' put there by meson
MESON_BUILD_DIR="./meson_bld"

cd $RUN_DIR
./scripts/irq2nvic_h ${JSON}
