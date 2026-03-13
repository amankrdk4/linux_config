#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
PKG_FILE="$SCRIPT_DIR/package.txt"

# 1. Update package database
echo "--- Updating Package Lists ---"
sudo apt update

# 2. Check if the file exists
if [ ! -f "$PKG_FILE" ]; then
    echo "Error: $PKG_FILE not found in the script directory!"
    exit 1
fi

echo "--- Starting Bulk Installation ---"

# 3. The Installation Command
# We use xargs to feed the list to apt. 
# --ignore-missing handles download issues.
# -n 1 ensures that if one package name is "bad", the rest still install.

cat "$PKG_FILE" | xargs -I % -n 1 sudo apt install -y --ignore-missing %

echo "------------------------------------------"
echo "Installation process complete!"
