#!/bin/bash

# Get the current microphone volume level
volume=$(pamixer --default-source --get-volume)

# Check if the microphone is muted
if pamixer --default-source --get-mute | grep -q "true"; then
  echo "muted"
else
  echo "$volume"
fi
