#!/bin/sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# brew #
########
brew list >"$script_dir/brew/list.txt" &
brew list --cask >"$script_dir/brew/list--cask.txt" &
brew leaves >"$script_dir/brew/leaves.txt" &
brew bundle dump --force --file="$script_dir/brew/Brewfile" &

################################
# await for all jobs to finish #
################################
wait

################
# push to repo #
################
(
	cd "$script_dir" &&
		git add . &&
		git commit -S -m "refresh" &&
		git push
)
