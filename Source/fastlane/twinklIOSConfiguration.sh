#!/bin/bash

# Define SwiftLint & SwiftFormat Versions

SWIFTFORMAT_VERSION="0.53.1"
SWIFTLINT_VERSION="0.53.0"

# Check to see if homebrew is installed on our developers machine
# If not we install the latest
# If it is check we have the latest
if ! command -v brew &> /dev/null
then
    echo "Homebrew not installed. Installing Homebrew..."
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        echo "✅ Homebrew installed successfully."
    else
        echo "❌ Failed to install Homebrew."
        exit 1
    fi
else
    echo "Homebrew is already installed. Updating Homebrew..."
    if brew update; then
        echo "✅ Homebrew updated successfully."
    else
        echo "❌ Failed to update Homebrew."
        exit 1
    fi
fi

# Install Mint to ensure that we lock our versions of SwiftLint and SwiftFormat
if ! command -v mint &> /dev/null; then
    echo "Mint is not installed. Installing Mint..."
    if ! brew install mint; then
        echo "❌ Failed to install Mint."
        exit 1
    fi
else
    echo "Mint is already installed. Checking for updates..."
    brew upgrade mint || echo "Mint is up to date."
fi

# Install SwiftFormat using Mint in our Repository
echo "Installing SwiftFormat version $SWIFTFORMAT_VERSION..."
if ! mint install nicklockwood/SwiftFormat@$SWIFTFORMAT_VERSION; then
    echo "❌ Failed to install SwiftFormat."
    exit 1
else
    echo "✅ SwiftFormat installed successfully."
fi

# Install SwiftLint using Mint in our Repository
echo "Installing SwiftLint version $SWIFTLINT_VERSION..."
if ! mint install realm/SwiftLint@$SWIFTLINT_VERSION; then
    echo "❌ Failed to install SwiftLint."
    exit 1
else
    echo "✅ SwiftLint installed successfully."
fi
