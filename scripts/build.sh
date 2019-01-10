#!/bin/bash

set -x

ROOT_DIR=$PWD

target=$1
task=$2
config=$3
link=$4

[ -z "$target" ] && echo target is not specified && exit 1
[ -z "$task" ] && task=rebuild
[ -z "$config" ] && config=release
[ -z "$link" ] && [ "$config" == "release" ] && link=static
[ -z "$link" ] && [ "$config" == "debug" ] && link=shared

[ "$task" != "build" ] && [ "$task" != "rebuild" ] && echo invalid task $task. must be build or rebuild && exit 1
[ "$config" != "release" ] && [ "$config" != "debug" ] && echo invalid config $config. must be release or debug && exit 1
[ "$link" != "static" ] && [ "$link" != "shared" ] && echo invalid link $link. must be static or shared && exit 1

[ -d "$thirdparty" ] || thirdparty=`readlink -f ${ROOT_DIR}/../thirdparty`
[ -d "$thirdparty" ] || thirdparty=`readlink -f ${ROOT_DIR}/../../thirdparty`
[ ! -d "$thirdparty" ] && echo thirdparty not found && exit 1

[ -d "$SOURCE_DIR" ] || SOURCE_DIR=`readlink -f ${ROOT_DIR}/Sources`
[ -d "$SOURCE_DIR" ] || SOURCE_DIR=`readlink -f ${ROOT_DIR}/../Sources`
[ ! -d "$SOURCE_DIR" ] && echo Sources dir not found && exit 1

[ -z "$BUILD_DIR" ] && BUILD_DIR=$ROOT_DIR/_build-$target-$config
[ -z "$REDIST_DIR" ] && REDIST_DIR=$ROOT_DIR/_build-redist-$target-$config
[ ! -d "$BUILD_DIR" ] && task=rebuild



echo target=$target
echo task=$task
echo config=$config
echo thirdparty=$thirdparty
echo source=$SOURCE_DIR
echo build=$BUILD_DIR

. "$thirdparty/scripts/toolset/$1" || exit 1

if [ "$COMPILER" == "msvc" ]; then
    [ "$config" == "debug" ] && debugflags="--enable-debug"
else
    [ "$config" == "debug" ] && debugflags="--debug=max"
    [ ! "$config" == "debug" ] && debugflags="--debug=none"
    
    [ "$link" == "static" ] && linkflags="--extra-ldflags=-static --pkg-config-flags=--static"
    [ "$link" == "shared" ] && linkflags="--extra-ldflags=-static-libgcc"
fi

if [ "$task" == "rebuild" ]; then
    rm -fR $BUILD_DIR
fi
mkdir -p $BUILD_DIR && cd $BUILD_DIR

#export ACLOCAL=/usr/bin/aclocal-1.15
#export AUTOMAKE=/usr/bin/automake-1.15

if [ "$COMPILER" == "msvc" ]; then
    echo $COMPILER is temporary not supported && exit 1
fi

env | grep PATH

if [ "$COMPILER" == "gcc" ]; then

    time.sh $SOURCE_DIR/configure --cross=${TARGET} $debugflags --enable-qsv --enable-vce --src=$SOURCE_DIR --launch-jobs=$(nproc) --launch
fi

cd $ROOT_DIR

