#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# brew #
########
echo "$0 >> Dumping brew state"
brew list >"$script_dir/list.txt" &
brew list --cask >"$script_dir/list--cask.txt" &
brew leaves >"$script_dir/leaves.txt" &
brew bundle dump --force --file="$script_dir/Brewfile" &

################################
# await for all jobs to finish #
################################
wait

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add . &&
				git commit -S -m "chore: refresh brew configs" &&
				git push &&
				echo "$0 >> Configs pushed to remote repository"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
