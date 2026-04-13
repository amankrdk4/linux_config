#!/bin/sh
launch(){
    cd $HOME
    git clone https://github.com/amankrdk4/boilerplate
    mkdir code
    cd code
    touch alpha.cpp inp.txt out.txt err.txt 
    nvim alpha.cpp inp.txt out.txt err.txt 
}
nlaunch() {
    local BASE_DIR="$HOME/code"
    local BOILERPLATE_DIR="$HOME/boilerplate"
    local DATE_STR=$(date +"%Y_%m_%d")
    local DAY_DIR="$BASE_DIR/$DATE_STR"

    # 1. Handle Tag Logic
    # If an argument is passed, it becomes _tag (e.g., _cf)
    local TAG_PART=""
    [[ -n "$1" ]] && TAG_PART="_$1"
    
    mkdir -p "$DAY_DIR"

    # 2. Extract Next Counter
    # Looks for 'p' followed by 5 digits at the very END of the folder name
    local LATEST_P=$(ls -1 "$DAY_DIR" 2>/dev/null | grep -o "p[0-9]\{5\}$" | sed "s/^p//" | sort -n | tail -1)
    
    # 10# avoids octal errors (00008/00009)
    local NEXT_VAL=$((10#${LATEST_P:-0} + 1))
    local COUNTER=$(printf "%05d" $NEXT_VAL)
    
    # 3. Target Path Construction
    local TARGET_DIR="$DAY_DIR/${DATE_STR}${TAG_PART}_p${COUNTER}"

    mkdir -p "$TARGET_DIR"
    cd "$TARGET_DIR" || return

    # 4. Environment Setup
    if [ ! -d "$BOILERPLATE_DIR" ]; then
        echo "Cloning boilerplate..."
        git clone https://github.com/amankrdk4/boilerplate "$BOILERPLATE_DIR"
    fi

    # Copy template and create essential CP files
    cp "$BOILERPLATE_DIR/alpha.cpp" ./alpha.cpp 2>/dev/null || touch alpha.cpp
    touch inp.txt out.txt err.txt

    echo "Launched: $TARGET_DIR"
    
    # Open with vertical split for input/output
    nvim  alpha.cpp inp.txt err.txt out.txt
}
alias nclean='() {
    local BASE_DIR="$HOME/code"
    local PAST_DIR="$BASE_DIR/past"
    local TODAY=$(date +"%Y_%m_%d")

    [[ ! -d "$BASE_DIR" ]] && return

    mkdir -p "$PAST_DIR"

    # Find folders matching the YYYY_MM_DD pattern
    for dir in "$BASE_DIR"/[0-9][0-9][0-9][0-9]_[0-9][0-9]_[0-9][0-9]/; do
        # Ensure it is a directory and not today s folder
        if [[ -d "$dir" ]]; then
            local dir_name=$(basename "$dir")
            if [[ "$dir_name" != "$TODAY" ]]; then
                echo "Archiving to past: $dir_name"
                mv "$dir" "$PAST_DIR/"
            fi
        fi
    done
    echo "Workspace tidied up."
}'
