#!/bin/sh

script_dir="$(cd "$(dirname "$0")" && pwd)"
brew list >"$script_dir/list.txt"
brew list --cask >"$script_dir/list--cask.txt"
brew leaves >"$script_dir/leaves.txt"
brew bundle dump --force --file="$script_dir/Brewfile"

(
	cd "$script_dir" &&
		git add Brewfile list.txt list--cask.txt leaves.txt &&
		git commit -S -m "refresh" &&
		git push
)
