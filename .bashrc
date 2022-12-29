# export PS1='<\[\033[0;32m\]\u@\h\[\033[0m\]:\w>$ '
# export PS1='<\[\]\u@\h\[\]:\w>$ '
export SCREENRC=$HOME/.config/screenrc
export HISTSIZE=1000
export HISTCONTROL=ignorespace
# export PS1='\[\033[34;40m\]\[\033[44;30m\] `pwd`  \[\033[34;40m\]\[\033[0;0m\] '
# export ANDROID_SDK=$HOME/android-sdk
# export ANDROID_SDK_HOME=$HOME/android-sdk
# export ANDROID_HOME=$HOME/android-sdk
export DOTNET_ROOT=$HOME/dotnet
export PATH=$HOME/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin/:$HOME/dotnet:$HOME/.local/bin:$HOME/go/bin:$PATH
alias sdkmanager='sdkmanager --sdk_root=$ANDROID_HOME'
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}

function print_prompt() {
	unset PS1
	PS1='\[\033[34;40m\]\[\033[44;30m\] '
	if [ $COLUMNS -le 60 ]; then
		PS1+="$(basename `pwd`)"
	else
		PS1+=`pwd`
	fi
	PS1+='  '
	if [ -d './.git' ]; then
		# local status=`git status -s`
		# status="${status:1:2}"
		local status=`git branch --show-current`
		PS1+='\[\033[34;42m\]'
		PS1+='\[\033[30;42m\]'
		PS1+=" $status "
		PS1+='\[\033[32;40m\]'
	else
		PS1+='\[\033[34;40m\]'
	fi
	PS1+='\[\033[0;0m\] '
}

function print_prompt1() {
	unset PS1
	PS1='[\[\033[0;44m\] $USER@$PWD \[\033[0;0m\]] '
}

PROMPT_COMMAND=print_prompt1

# This function is called whenever a command is not found.
function command_not_found_handle() {
  local p='/nix/store/yg6vligw4m5mw13pywd3yrvly3ldblnx-command-not-found/bin/command-not-found'
  if [ -x "$p" ] && [ -f '/nix/var/nix/profiles/per-user/root/channels/nixos/programs.sqlite' ]; then
    # Run the helper program.
    "$p" "$@"
    # Retry the command if we just installed it.
    if [ $? = 126 ]; then
      "$@"
    else
      return 127
    fi
  else
    echo "$1: 😭😭 command not found" >&2
    return 127
  fi
}

# function cd() {
# 	echo $@
# 	cd $@
# }

# alias pip3='pip3 --user'
# alias pip='pip --user'
alias ls='exa --icons'
alias cat='cat -n'
alias lzy='lazygit'

# setup funky
# command -v funky &>/dev/null && eval "$(funky --init bash)"

# source /nix/store/04yzk79045lsz22yfkwpd1bc05hvg1pb-autojump-22.5.3/share/autojump/autojump.bash
# alias dots='/usr/bin/env git --git-dir=/home/nrdybhu1/.cfg/ --work-tree=/home/nrdybhu1'
alias copy='xclip -sel clip'
[[ -s /home/nrdybhu1/.autojump/etc/profile.d/autojump.sh ]] && source /home/nrdybhu1/.autojump/etc/profile.d/autojump.sh

# load_theme
nerdfetch
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/home/nrdybhu1/.nimble/bin:$PATH

export PATH=$PATH:/home/nrdybhu1/.spicetify
