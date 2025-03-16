#!/bin/bash
# Fetch workspaces from Niri and format for EWW
output=$(niri msg workspaces 2>/dev/null)

if [ $? -ne 0 ]; then
  echo "[]"
  exit 1
fi

# Extract the active workspace (strip non-numeric characters)
active=$(echo "$output" | awk '/\*/ {gsub(/[^0-9]/, "", $0); print}')

# Extract all workspace numbers (ignore the first line and non-numeric data)
workspaces=$(echo "$output" | awk 'NR>1 {gsub(/[^0-9]/, "", $0); print}')

# Format as JSON for EWW
echo "["
echo "$workspaces" | while read -r ws; do
  active_bool=$([ "$ws" = "$active" ] && echo "true" || echo "false")
  echo "  { \"name\": \"$ws\", \"active\": $active_bool },"
done | sed '$ s/,$//'
echo "]"
