#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# nvim #
########
echo "$0 >> Dumping init.lua state"
cp "$HOME/.config/nvim/init.lua" "$script_dir"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add init.lua &&
				git commit -S -m "chore: refresh nvim config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
