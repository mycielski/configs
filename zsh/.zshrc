#############
# oh-my-zsh #
#############

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	colored-man-pages  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages
	dircycle  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dircycle
	direnv  # https://github.com/direnv/direnv
	eza  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/eza
	gcloud  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gcloud
	git-auto-fetch  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-auto-fetch
	git  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
	gitignore  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
	# globalias  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/globalias
	ipfs  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ipfs
	macos  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
	mix  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/mix
	opentofu  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/opentofu
	per-directory-history  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/per-directory-history
	rust  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust
	screen  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/screen
	tailscale  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tailscale
	web-search  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
)

# Plugins config.
HISTORY_START_WITH_GLOBAL=true

# Run Oh My Zsh with the above config.
source $ZSH/oh-my-zsh.sh

#########################
# environment variables #
#########################

export RCLONE_FAST_LIST=1

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

###########
# aliases #
###########
# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="nvim"
alias vim="nvim"
alias k="kubectl"
alias wget="wget -c --tries=0 --read-timeout=30 --waitretry=10"
alias upgrade="(echo '>> Updating brew repo'; brew update && echo '>> Upgrading brew packages'; brew upgrade && echo '>> Upgrading App Store packages'; mas upgrade && echo '>> Removing dangling packages'; brew autoremove && echo '>> Cleaning up'; brew cleanup && echo '>> Removing .DS_Store from $(pwd)'; rmdsstore 2>/dev/null || echo '!! Failed to remove .DS_Store') && (~/Desktop/configs/refresh.sh || echo '>> Configs already up-to-date.'); echo '>> All done!'"

##################
# autostart tmux #
##################
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux
fi

#################################
# activate powerlevel10k prompt #
#################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###################
# activate zoxide #
###################
eval "$(zoxide init zsh --cmd j)"

