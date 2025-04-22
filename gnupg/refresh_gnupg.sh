#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

#########
# gnupg #
#########
echo "$0 >> Dumping gpg-agent.conf state"
cp "$HOME/.gnupg/gpg-agent.conf" "$script_dir"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add . &&
				git commit -S -m "chore: refresh gpg agent config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
