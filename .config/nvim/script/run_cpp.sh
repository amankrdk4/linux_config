#!/bin/bash

# --- ARGUMENTS ---
# Usage: ./runner.sh <dir> <file_full> <file_no_ext> <inp> <out> <err> <stats> <pch_dir>
TARGET_DIR="$1"
FILE_FULL="$2"
FILE_NAME="$3"
IN_FILE="$4"
OUT_FILE="$5"
ERR_FILE="$6"
STATS_FILE="$7"

# --- SAFETY FALLBACK FOR PCH_DIR ---
# If $8 is empty, default to a safe local directory
PCH_BASE="${8:-/tmp/cppheaders}"
PCH_ROOT="${PCH_BASE/#\~/$HOME}"
LOCAL_BITS="$PCH_ROOT/bits"

# --- COMPILER FLAGS ---
FLAGS="-std=c++17 -Ofast -march=native -fno-stack-protector -pipe -DLOCAL"

# --- 1. PRE-FLIGHT ---
cd "$TARGET_DIR" || exit 1
: > "$OUT_FILE"
: > "$ERR_FILE"
: > "$STATS_FILE"

# --- 2. AGGRESSIVE HEADER DISCOVERY ---
# Searches standard and architecture-specific paths for stdc++.h
SYS_HEADER=$(find /usr/include/c++/ /usr/include/x86_64-linux-gnu/c++/ -name "stdc++.h" 2>/dev/null | grep -v "gch" | sort -V | tail -n 1)

# Emergency fallback for specific GCC layouts if find fails
if [[ -z "$SYS_HEADER" ]]; then
    for v in {14,13,12,11}; do
        [ -f "/usr/include/c++/$v/x86_64-linux-gnu/bits/stdc++.h" ] && SYS_HEADER="/usr/include/c++/$v/x86_64-linux-gnu/bits/stdc++.h" && break
        [ -f "/usr/include/c++/$v/bits/stdc++.h" ] && SYS_HEADER="/usr/include/c++/$v/bits/stdc++.h" && break
    done
fi

# --- 3. PCH SETUP ---
# Prevent the script from ever hitting '/bits' due to path mangling
if [[ "$LOCAL_BITS" == "/bits" ]]; then
    LOCAL_BITS="./bits"
    PCH_ROOT="."
fi

mkdir -p "$LOCAL_BITS"

# Build PCH if it doesn't exist
if [[ ! -f "$LOCAL_BITS/stdc++.h.gch" ]]; then
    if [[ -n "$SYS_HEADER" ]]; then
        cp -p "$SYS_HEADER" "$LOCAL_BITS/stdc++.h"
        echo "Building Precompiled Header (PCH)..." > "$STATS_FILE"
        g++ $FLAGS "$LOCAL_BITS/stdc++.h" -o "$LOCAL_BITS/stdc++.h.gch" 2>> "$ERR_FILE"
    else
        echo "Error: System stdc++.h not found!" >> "$ERR_FILE"
    fi
fi

# --- 4. COMPILATION ---
# -I points to the directory containing the 'bits' folder
g++ $FLAGS -I"$PCH_ROOT" "$FILE_FULL" -o "$FILE_NAME" 2>> "$ERR_FILE"

if [[ $? -eq 0 ]]; then
    # --- 5. EXECUTION ---
    # stdbuf -i0 -o0 -e0 ensures no-delay logging for Neovim
    /usr/bin/time -f "Time: %es\nMemory: %MKB" -o "$STATS_FILE" \
    timeout 6.9s stdbuf -i0 -o0 -e0 ./"$FILE_NAME" < "$IN_FILE" > "$OUT_FILE" 2>> "$ERR_FILE"
else
    echo "COMPILATION FAILED" > "$OUT_FILE"
    cat "$ERR_FILE" >> "$STATS_FILE"
fi

# --- 6. FINAL SYNC & VERIFICATION ---
sync "$OUT_FILE" "$ERR_FILE" "$STATS_FILE"

echo -e "\n--- PCH STATUS ---" >> "$STATS_FILE"
if g++ $FLAGS -I"$PCH_ROOT" -H -fsyntax-only "$FILE_FULL" 2>&1 | grep -q "$LOCAL_BITS/stdc++.h.gch"; then
    echo "PCH: ACTIVE (SPEED++)" >> "$STATS_FILE"
else
    echo "PCH: INACTIVE (FALLBACK)" >> "$STATS_FILE"
fi
