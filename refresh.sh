#!/bin/sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# brew #
########
echo "$0 >> Dumping brew state"
brew list >"$script_dir/brew/list.txt" &
brew list --cask >"$script_dir/brew/list--cask.txt" &
brew leaves >"$script_dir/brew/leaves.txt" &
brew bundle dump --force --file="$script_dir/brew/Brewfile" &

################################
# await for all jobs to finish #
################################
wait
echo "$0 >> Brew state dumped"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add . &&
				git commit -S -m "refresh" &&
				git push &&
				echo "$0 >> Configs pushed to remote repository"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
