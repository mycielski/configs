#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

##########
# ranger #
##########
echo "$0 >> Dumping ranger config state"
ranger_cfg_dir="$HOME/.config/ranger"
cp "$ranger_cfg_dir/commands.py" "$script_dir" &
cp "$ranger_cfg_dir/commands_full.py" "$script_dir" &
cp "$ranger_cfg_dir/rc.conf" "$script_dir" &
cp "$ranger_cfg_dir/rifle.conf" "$script_dir" &
cp "$ranger_cfg_dir/scope.sh" "$script_dir" &

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add . &&
				git commit -S -m "chore: refresh ranger config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
