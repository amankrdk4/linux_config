#!/bin/bash
DIR=$1
FILE_FULL=$2
FILE_NO_EXT=$3
INP=$4
OUT=$5
ERR=$6
STATS=$7

cd "$DIR" || exit

# 1. Precompile bits/stdc++.h if the GCH doesn't exist
# Using a more generic path for Debian 12
GCH_HEADER="/usr/include/c++/12/bits/stdc++.h" 
if [ ! -f "bits/stdc++.h.gch" ]; then
    mkdir -p bits
    if [ -f "$GCH_HEADER" ]; then
        cp "$GCH_HEADER" ./bits/
        # Include -DLOCAL here as well if you use it in headers, 
        # but usually just standard flags are enough for GCH
        g++ -std=c++20 -O2 ./bits/stdc++.h -o ./bits/stdc++.h.gch 2>/dev/null
    fi
fi

# 2. Compile with the -DLOCAL flag
# This triggers your template's "Standard I/O" logic
g++ -std=c++20 -O2 -DLOCAL "$FILE_FULL" -o "$FILE_NO_EXT" 2> "$ERR"

if [ $? -eq 0 ]; then
    # 3. Run with the specific 6.9s timeout
    /usr/bin/time -f "Time: %es\nMemory: %MKB" -o "$STATS" \
    timeout 6.9s ./"$FILE_NO_EXT" < "$INP" > "$OUT" 2>> "$ERR"
    
    if [ $? -eq 124 ]; then
        echo "RESULT: TIME LIMIT EXCEEDED (6.9s)" >> "$STATS"
    fi
else
    echo "COMPILATION FAILED" > "$OUT"
    cat "$ERR" > "$STATS" # Helpful to see errors in the stats pane too
fi
