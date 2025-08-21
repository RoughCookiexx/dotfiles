#!/bin/bash

set -euo pipefail

SOURCE_DIRS=(hypr)
DEST_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config_backup_$(date +%s)"
mkdir -p "$BACKUP_DIR"

for dir in "${SOURCE_DIRS[@]}"; do
	src="$(pwd)/$dir"
	dest="$DEST_DIR/$dir"

	mkdir -p "$(dirname "$dest")"
	
	echo "Backing up exist files (-) and creating symlinks for new files (+)"
	for file in "$src"/*; do
		target="$dest/$(basename "$file")"

		if [ -e "$target" ] && [ ! -L "$target" ]; then
			echo "    -$target"
			mv "$target" "$BACKUP_DIR/"
		fi

		echo "    +$target"
		ln -sf "$file" "$target"
	done
done

