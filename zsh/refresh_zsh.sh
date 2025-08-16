#!/usr/bin/env sh

script_dir="$(cd "$(dirname "$0")" && pwd)"

########
# tmux #
########
echo "$0 >> Dumping .zshrc and .p10k.zsh"
cp "$HOME/.zshrc" "$script_dir" &
cp "$HOME/.p10k.zsh" "$script_dir" &

wait

################
# push to repo #
################
(
	cd "$script_dir" &&
		if [[ -n $(git status --short .) ]]; then
			echo "$0 >> Commiting configs to git" &&
				git add ".zshrc" ".p10k.zsh" &&
				git commit -S -m "chore: refresh zsh config" &&
				echo "$0 >> Changes commited"
		else
			echo "$0 >> Configs already up-to-date in remote"
		fi
)
