#!/bin/bash
DIR=$1
FILE_FULL=$2
FILE_NO_EXT=$3
INP=$4
OUT=$5
ERR=$6
STATS=$7
PCH_DIR=$8

# --- DYNAMIC CONFIGURATION ---
SYSTEM_HEADER_PATH=$(find /usr/include/c++/ /usr/include/x86_64-linux-gnu/c++/ -name "stdc++.h" 2>/dev/null | grep -v "gch" | head -n 1)
SYSTEM_BITS_DIR=$(dirname "$SYSTEM_HEADER_PATH")
# ----------------------------

cd "$DIR" || exit

# Clear previous results to prevent ghosting
> "$OUT"
> "$ERR"

FLAGS="-std=c++17 -Ofast -march=native -fno-stack-protector -pipe -DLOCAL"
PCH_DIR_EXPANDED="${PCH_DIR/#\~/$HOME}"
LOCAL_BITS="$PCH_DIR_EXPANDED/bits"

mkdir -p "$LOCAL_BITS"

# 1. PCH Logic
if [ ! -f "$LOCAL_BITS/stdc++.h.gch" ]; then
    cp "$SYSTEM_BITS_DIR/stdc++.h" "$LOCAL_BITS/stdc++.h"
    g++ $FLAGS "$LOCAL_BITS/stdc++.h" -o "$LOCAL_BITS/stdc++.h.gch" 2>> "$ERR"
fi

# 2. Compilation
g++ $FLAGS -I"$PCH_DIR_EXPANDED" "$FILE_FULL" -o "$FILE_NO_EXT" 2>> "$ERR"

if [ $? -eq 0 ]; then
    # 3. Execution
    /usr/bin/time -f "Time: %es\\nMemory: %MKB" -o "$STATS" \
    timeout 6.9s ./"$FILE_NO_EXT" < "$INP" > "$OUT" 2>> "$ERR"
else
    echo "COMPILATION FAILED" > "$OUT"
    cat "$ERR" >> "$STATS"
fi

# 4. Critical: Force File Sync
# This ensures out.txt and err.txt are physically written before Neovim reads them
sync "$OUT" "$ERR" "$STATS"

# 5. Status Check
echo -e "\n--------------------------" >> "$STATS"
if g++ $FLAGS -I"$PCH_DIR_EXPANDED" -H -fsyntax-only "$FILE_FULL" 2>&1 | grep -q "stdc++.h.gch"; then
    echo "PCH Status: WORKING" >> "$STATS"
else
    echo "PCH Status: FAILED" >> "$STATS"
fi
