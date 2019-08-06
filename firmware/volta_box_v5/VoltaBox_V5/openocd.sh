set -x

TOOLS=$1; RESOURCES=$2; shift 2
DYLD_LIBRARY_PATH="$TOOLS/openocd/lib" \
    exec "$TOOLS/openocd/bin/openocd" \
        --search "$RESOURCES/openocd/scripts" \
        --search "$RESOURCES/openocd/st_scripts" \
        "$@"
