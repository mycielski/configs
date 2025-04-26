#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

#############
# alacritty #
#############
echo "$0 >> Saving alacritty config"
alacritty_config_dir="$HOME/.config/alacritty"
cp "$alacritty_config_dir/alacritty.toml" "$script_dir"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add alacritty.toml &&
				git commit -S -m "chore: refresh alacritty config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
