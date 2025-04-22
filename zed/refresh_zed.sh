#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# tmux #
########
echo "$0 >> Dumping keymap.json and settings.json"
zed_config_dir="$HOME/.config/zed"
cp "$zed_config_dir/keymap.json" "$script_dir" &
cp "$zed_config_dir/settings.json" "$script_dir" &

wait

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add keymap.json settings.json &&
				git commit -S -m "chore: refresh zed config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
