#!/bin/bash
# Build script for macOS

echo "==================================="
echo "EEGVision macOS Build Script"
echo "==================================="

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: This script is for macOS only"
    exit 1
fi

# Navigate to project directory
cd "$(dirname "$0")"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Install/upgrade dependencies
echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf build dist

# Build the app
echo "Building EEGVision.app..."
pyinstaller eegvision.spec --clean

# Check if build was successful
if [ -d "dist/EEGVision.app" ]; then
    echo ""
    echo "==================================="
    echo "Build successful!"
    echo "==================================="
    echo "App location: dist/EEGVision.app"
    echo ""
    echo "To run: open dist/EEGVision.app"
    echo "To distribute: zip the EEGVision.app folder"
else
    echo ""
    echo "Build failed. Check the output above for errors."
    exit 1
fi

# Deactivate virtual environment
deactivate
