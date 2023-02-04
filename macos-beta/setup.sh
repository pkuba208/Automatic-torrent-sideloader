#!/bin/bash
xcode-select --install
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
/bin/bash install.sh
brew install aria2
brew install git
brew install --cask android-platform-tools
mkdir quest2downloads
echo DONE
