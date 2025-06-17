###########
#Author:Parvez
#Version:V1
###########

#!/usr/bin/env bash

required_files=( .env functions.sh )
ALL_FOUND=1

# Check for required files
for file in "${required_files[@]}"; do
  if [ ! -f "$file" ]; then
    echo "file not found: $file" 
    ALL_FOUND=0
  fi
done

# Proceed if all found
if [ "$ALL_FOUND" -eq 1 ]; then
  for file in "${required_files[@]}"; do
    source "$file"
  done

  while true; do
    monitor_cpu
    monitor_memory
    monitor_disk
    sleep 60
  done
else
  echo "Required file(s) missing. Exiting."
  exit 1
fi