#!/bin/bash

# Exit script on error
set -e

# Define build directories
SOURCE_DIR="."
BUILD_DIR="build"

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

# Copy all relevant files to the build directory
echo "Copying files to build directory..."
cp -r $SOURCE_DIR/*.html $BUILD_DIR/
cp -r $SOURCE_DIR/*.js $BUILD_DIR/
cp -r $SOURCE_DIR/*.mp3 $BUILD_DIR/ # Assuming audio files are mp3
cp -r $SOURCE_DIR/*.png $BUILD_DIR/ # Assuming images are png
cp -r $SOURCE_DIR/*.jpg $BUILD_DIR/ # Assuming images are jpg
cp -r $SOURCE_DIR/*.gif $BUILD_DIR/ # Assuming images are gif

# Optionally, you can include other tasks like:
# - Minifying CSS files
# - Minifying JavaScript files

# Example: Minify CSS files using a tool like cssnano (if installed)
# echo "Minifying CSS files..."
# find $BUILD_DIR -name "*.css" -exec cssnano {} {} \;

# Example: Minify JavaScript files using a tool like terser (if installed)
# echo "Minifying JavaScript files..."
# find $BUILD_DIR -name "*.js" -exec terser {} --compress --mangle -o {} \;

echo "Build complete."
