mvd() {
  DATE_STR="$(date "+%Y_%m_%d_%H_%M_%S")"
  file_wtd="$1"

  if [ -z "$file_wtd" ]; then
    echo "Usage: mvd <filename>"
    return 1
  fi

  if [ ! -e "$file_wtd" ]; then
    echo "Error: File '$file_wtd' does not exist."
    return 1
  fi

  new_name="${DATE_STR}_${file_wtd}"

  if [ -e "$new_name" ]; then
    echo "Error: Target file '$new_name' already exists."
    return 1
  fi

  mv "$file_wtd" "$new_name"

  if [ $? -eq 0 ]; then
    echo "Renamed '$file_wtd' → '$new_name'"
  else
    echo "Error: Failed to rename '$file_wtd'"
    return 1
  fi
}

