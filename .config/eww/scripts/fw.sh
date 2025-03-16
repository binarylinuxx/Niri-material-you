#!/bin/bash
output=$(niri msg focused-window)
app_id=$(echo "$output" | sed -n 's/.*Title: "\([^"]*\)".*/\1/p')
echo "$app_id"
