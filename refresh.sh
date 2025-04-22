#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

find "$script_dir" -type f -not -path "*.git*" -path "$script_dir/*/refresh_*.sh" #| xargs -n1 -P0 sh

git add "$script_dir"
git commit -S -m "chore: general updates"

git push || echo "$0 >> Nothing to push"
echo "$0 >> All done!"
