#!/bin/bash
# modify from how2heap's glibc_build.sh

# YOU SHOULD FIRST
#+sudo apt install bear
#+for generating the compile_commands.json file


if [[ $# < 2 ]]; then
    echo "Usage: $0 version #make-threads"
    exit 1
fi

VERSION=$1
SRC="./glibc_src"
BUILD="$SRC"_"$VERSION"_build

# Get glibc source
if [ -d "$SRC" ]; then
    cd $SRC
    git pull --all
else
    # may be you have to set http_proxy
    git clone http://sourceware.org/git/glibc.git "$SRC"
    cd "$SRC"
    git pull --all
fi

# Checkout release
git rev-parse --verify --quiet "refs/remotes/origin/release/$1/master"
if [[ $? != 0 ]]; then
    echo "Error: Glibc version does not seem to exists"
    exit 1
fi

git checkout "release/$1/master" -f
cd -

# Build
mkdir -p $BUILD
cd "$BUILD" && rm -rf ./*
../"$SRC"/configure --prefix=/usr
bear make -j "$2"
cd -

echo -e "\n"

echo "Finish!"
echo "SOURCE_DIRECTORY:"
echo "$PWD"/`basename $SRC`

echo "BUILD_DIRECTORY:"
echo $PWD/`basename $BUILD`

echo -e "\n"
