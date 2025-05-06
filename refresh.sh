#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

find "$script_dir" -path "$script_dir/.git" -prune -or -type f -path "$script_dir/*/refresh_*.sh" -print | xargs -n1 -P0 sh

(
	cd "$script_dir" &&
		git push || echo "$0 >> Nothing to push";
	git pull
)

echo "$0 >> All done!"
