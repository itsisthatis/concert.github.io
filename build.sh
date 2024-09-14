#!/bin/bash

# Exit script on error
set -e

# Define build directories
SOURCE_DIR="src"
BUILD_DIR="build"

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

# Copy HTML files to the build directory
echo "Copying HTML files..."
cp -r $SOURCE_DIR/*.html $BUILD_DIR/

# Copy JavaScript files to the build directory
echo "Copying JavaScript files..."
cp -r $SOURCE_DIR/js $BUILD_DIR/

# Copy audio and video files to the build directory
echo "Copying media files..."
cp -r $SOURCE_DIR/media $BUILD_DIR/

# Copy images to the build directory
echo "Copying images..."
cp -r $SOURCE_DIR/images $BUILD_DIR/

# Optionally, you can include other tasks like:
# - Minifying CSS files
# - Minifying JavaScript files

# Example: Minify CSS files using a tool like cssnano (if installed)
# echo "Minifying CSS files..."
# find $BUILD_DIR/css -name "*.css" -exec cssnano {} {} \;

# Example: Minify JavaScript files using a tool like terser (if installed)
# echo "Minifying JavaScript files..."
# find $BUILD_DIR/js -name "*.js" -exec terser {} --compress --mangle -o {} \;

echo "Build complete."
