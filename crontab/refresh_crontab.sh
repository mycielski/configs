#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

###########
# crontab #
###########
if [ "$(id -u)" -eq 0 ]; then
	########
	# root #
	echo "$0 >> Dumping root's crontab -l"
	crontab -l >"$script_dir/root" &
	sudo --user "$SUDO_USER" "$0" &
	wait
	exit
fi

########
# user #
echo "$0 >> Dumping user's crontab -l"
crontab -l >"$script_dir/user"

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add user &&
				git add root
			git commit -S -m "chore: refresh crontab config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
