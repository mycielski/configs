#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

#######
# mas #
#######
echo "$0 >> Dumping App Store list"
mas list >"$script_dir/list"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add list &&
				git commit -S -m "chore: refresh mas list" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
