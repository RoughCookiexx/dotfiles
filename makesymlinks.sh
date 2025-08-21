#!/bin/bash

set -euo pipefail

SOURCE_FILES=(
	".config/hypr/hyprland.conf"
	".config/hypr/hyprpaper.conf"
)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
DEST_DIR="$HOME"
BACKUP_DIR="$HOME/.config_backup_$(date +%s)"
mkdir -p "$BACKUP_DIR"

echo "Backing up existing files (-) and creating symlinks for new files (+)"
for file in "${SOURCE_FILES[@]}"; do
	src="$SCRIPT_DIR/$file"
	dest="$DEST_DIR/$file"

	mkdir -p "$(dirname "$dest")"

	if [ -e "$dest" ]; then
		echo "    -$dest"
		mv "$dest" "$BACKUP_DIR/"
	fi

	echo "    +$dest"
	ln -sf "$file" "$dest"
done

