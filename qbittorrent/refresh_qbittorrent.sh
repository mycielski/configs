#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# tmux #
########

################
# push to repo #
################
(
	cd "$script_dir" &&
		echo "$0 >> Updating search plugins" &&
		cd "$script_dir/search-plugins" &&
		git pull &&
		cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add search-plugins &&
				git commit -S -m "chore(qbittorrent): refresh search-plugins" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
