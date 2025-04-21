#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# btop #
########
echo "$0 >> Dumping btop.conf state"
cp "$HOME/.config/btop/btop.conf" "$script_dir/btop.conf"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add . &&
				git commit -S -m "chore: refresh btop config" &&
				git push &&
				echo "$0 >> Configs pushed to remote repository"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
