#!/usr/bin/env python3
import os
import configparser
from pathlib import Path

applications = []

# Desktop file directories
desktop_dirs = [
    Path("/usr/share/applications/"),
    Path.home() / ".local/share/applications/",
]

for desktop_dir in desktop_dirs:
    if not desktop_dir.exists():
        continue
    for desktop_file in desktop_dir.glob("*.desktop"):
        config = configparser.ConfigParser(strict=False)
        try:
            config.read(desktop_file)
            entry = config["Desktop Entry"]
        except:
            continue

        if entry.get("NoDisplay", "false").lower() == "true":
            continue
        if entry.get("Type") != "Application":
            continue

        name = entry.get("Name", "")
        icon = entry.get("Icon", "")
        desktop_id = desktop_file.stem

        if name and icon and desktop_id:
            applications.append({
                "name": name.replace('"', '\\"'),
                "icon": icon.replace('"', '\\"'),
                "desktop_id": desktop_id
            })

# Sort alphabetically
applications.sort(key=lambda x: x["name"])

# Generate YUCK markup
for app in applications:
    print(f"""(button
  :class "app-button"
  :onclick "exec gtk-launch {app['desktop_id']} & eww close app_launcher"
  (box :class "app-entry"
    (image :class "app-icon" :icon "{app['icon']}")
    (label :class "app-name" "{app['name']}")
  ))""")
