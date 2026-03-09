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
# This is usually located at /usr/include/c++/v1/ (clang) or /usr/include/x86_64-linux-gnu/c++/(gcc)
# For Debian, we'll target the standard GCC path.
GCH_HEADER="/usr/include/x86_64-linux-gnu/c++/12/bits/stdc++.h" # Adjust version if needed
if [ ! -f "bits/stdc++.h.gch" ]; then
    mkdir -p bits
    # Copying or symlinking the header to a local 'bits' folder for local gch generation
    cp /usr/include/x86_64-linux-gnu/c++/12/bits/stdc++.h ./bits/ 2>/dev/null
    g++ -std=c++17 ./bits/stdc++.h -o ./bits/stdc++.h.gch 2>/dev/null
fi

# 2. Compile (The Lua config decides if this needs to run)
# Added -O2 for realistic CP performance
g++ -std=c++17 -O2 "$FILE_FULL" -o "$FILE_NO_EXT" 2> "$ERR"

if [ $? -eq 0 ]; then
    # 3. Run with the specific 6.9s timeout
    /usr/bin/time -f "Time: %es\nMemory: %MKB" -o "$STATS" \
    timeout 6.9s ./"$FILE_NO_EXT" < "$INP" > "$OUT" 2>> "$ERR"
    
    if [ $? -eq 124 ]; then
        echo "RESULT: TIME LIMIT EXCEEDED (6.9s)" >> "$STATS"
    fi
else
    echo "COMPILATION FAILED" > "$OUT"
fi
