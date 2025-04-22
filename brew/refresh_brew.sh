#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# brew #
########
echo "$0 >> Dumping brew state"
brew list >"$script_dir/list" &
brew list --cask >"$script_dir/list--cask" &
brew leaves >"$script_dir/leaves" &
brew tap >"$script_dir/tap" &
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
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add list list--cask leaves tap Brewfile &&
				git commit -S -m "chore: refresh brew configs" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
