#!/bin/bash 

set -eux 

printf "entering source directory...\n"
cd "$SRC_WEBSITE"
npm i 
mkdir "$SRC_MODIFIED_WEBSITE" && cp -r . "$SRC_MODIFIED_WEBSITE/"
printf "building first website\n"
vue-cli-service build --dest "$BUILD_WEBHIST"
printf "First website built\n"
cd "$SRC_MODIFIED_WEBSITE"

# modifying the second website
sed -i 's/createWebHistory/createMemoryHistory/g' ./src/router/index.js
sed -i 's/website1/website2/g' ./vue.config.js

printf "Build second website\n"
vue-cli-service build --dest "$BUILD_MEMHIST"
printf "Second website built\n"
