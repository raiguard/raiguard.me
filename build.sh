#!/bin/sh

if [ -d "build" ]; then
    rm -rf build
fi
mkdir build
cp avatar.png build/avatar.png
cp index.html build/index.html
sass -s compressed --no-source-map style.scss build/style.css

