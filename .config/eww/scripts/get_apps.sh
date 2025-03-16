#!/bin/bash
apps=()
while IFS= read -r file; do
  name=$(grep -m1 '^Name=' "$file" | cut -d= -f2)
  exec_cmd=$(grep -m1 '^Exec=' "$file" | cut -d= -f2 | sed 's/%[^ ]* *//g')
  if [ ! -z "$name" ] && [ ! -z "$exec_cmd" ]; then
    apps+=("{\"name\":\"$name\", \"command\":\"$exec_cmd\"}")
  fi
done < <(find /usr/share/applications -name "*.desktop")
echo "[$(IFS=,; echo "${apps[*]}")]"
