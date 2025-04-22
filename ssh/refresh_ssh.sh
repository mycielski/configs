#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# nvim #
########
echo "$0 >> Dumping config state"
cp "$HOME/.ssh/config" "$script_dir/config"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add . &&
				(git-crypt status . | grep "  encrypted: config$" 1>/dev/null || (echo "$0 !! git-crypt error"; false)) &&
				git commit -S -m "chore: refresh ssh config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
