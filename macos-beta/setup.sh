#!/bin/bash
xcode-select --install
echo "Press any key to continue..."
read -n 1 -s -r
echo "Resuming script..."
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
/bin/bash install.sh
echo "Press any key to continue..."
read -n 1 -s -r
echo "Resuming script..."
brew install aria2
brew install git
brew install --cask android-platform-tools
mkdir quest2downloads
echo DONE
