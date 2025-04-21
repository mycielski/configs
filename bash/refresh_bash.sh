#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# bash #
########
echo "$0 >> Dumping .bashrc state"
cp "$HOME/.bashrc" "$script_dir/.bashrc"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add . &&
				git commit -S -m "chore: refresh bash config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
