#!/bin/bash

if [[ $# < 1 ]]; then
    echo "Usage: $0 version"
    exit 1
fi

BASE_NAME=glibc_src
VERSION=$1
CB_DIR=~/codebrowser

PROJ_NAME="$BASE_NAME"_$VERSION
OUTPUT_DIRECTORY=$CB_DIR/$PROJ_NAME
DATA_DIRECTORY=$OUTPUT_DIRECTORY/../data  # do not modify

# copy from build.sh if you want to change the default
SOURCE_DIRECTORY=~/glibc/glibc_src
BUILD_DIRECTORY=~/glibc/glibc_src_"$VERSION"_build

# run this script under woboq_codebrowser/
if [ -x ./generator/codebrowser_generator ] && [ -x ./indexgenerator/codebrowser_indexgenerator ]; then
    ./generator/codebrowser_generator -b $BUILD_DIRECTORY -a -o $OUTPUT_DIRECTORY -p $PROJ_NAME:$SOURCE_DIRECTORY:$VERSION
    ./indexgenerator/codebrowser_indexgenerator $OUTPUT_DIRECTORY
    #cp -rv ./data $DATA_DIRECTORY

    echo -e "\n"
    echo "Finish!"
    echo "Now you can open file://$OUTPUT_DIRECTORY/index.html for a quick look."
    echo "Host the directory with web server(e.g. nginx) to get the most out of it!"
    echo -e "\n"
else
    echo "Compile the generator first"
    echo "see https://github.com/woboq/woboq_codebrowser#compiling-the-generator-on-linux"
fi
