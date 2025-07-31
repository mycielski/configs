#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

############
# binaries #
############
echo "$0 >> Dumping list of binaries in path"
echo "$PATH" | tr ':' '\0' | xargs -0 -I{} find "{}" 2>/dev/null | sort | uniq >"$script_dir/enumerated" &

########
# path #
########
echo "$0 >> Dumping \$PATH"
echo "$PATH" >"$script_dir/path"

wait

##################
# commit to repo #
##################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add enumerated &&
				git add path &&
				git commit -S -m "chore: refresh \$PATH data" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
