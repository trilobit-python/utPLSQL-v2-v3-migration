#!/bin/bash
set -e

SQLCL_FILE=sqlplus-linux.x64-18.3.0.0.0dbru.zip
cd .travis

# Download if not present on cache dir.
if [ ! -f $CACHE_DIR/$SQLCL_FILE ]; then
    npm install -g phantomjs-prebuilt casperjs
    bash download.sh -p sqlplus
    mv $SQLCL_FILE $CACHE_DIR
else
    echo "Installing sqlplus from cache..."
fi;

# Install sqlcl.
unzip -q $CACHE_DIR/$SQLCL_FILE -d $HOME

# Check if it is installed correctly.
$SQLCLI -v
