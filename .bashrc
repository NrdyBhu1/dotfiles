# export PS1='<\[\033[0;32m\]\u@\h\[\033[0m\]:\w>$ '
# export PS1='<\[\]\u@\h\[\]:\w>$ '
export SCREENRC=$HOME/.config/screenrc
export HISTSIZE=1000
export HISTCONTROL=ignorespace
export PS1='\[\033[34;40m\]\[\033[44;30m\] `pwd`  \[\033[34;40m\]\[\033[0;0m\] '
# export ANDROID_SDK=$HOME/android-sdk
# export ANDROID_SDK_HOME=$HOME/android-sdk
# export ANDROID_HOME=$HOME/android-sdk
export ANDROID_HOME=$HOME/Android
export WABT_PATH=$HOME/Programming/thirdparty/wabt
export PATH=$HOME/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin/:$HOME/.local/bin:$HOME/go/bin:$HOME/android-sdk/cmdline-tools/bin:$PATH
export BEMENU_BACKEND=curses
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

PROMPT_COMMAND=print_prompt

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

activate_venv() {
  if [ -f ./bin/activate ]; then
    source ./bin/activate
  else
    echo "No venv found!"
    return 127
  fi
}

load_theme() {
	wal -e -n --theme horikita
	clear
	nerdfetch
}

deactivate_venv() {
  if [ -n $_OLD_VIRTUAL_PATH ]; then
    type deactivate &>/dev/null && deactivate || echo "venv not found."
  else
    echo "No venv activated"
    return 127
  fi
}

# alias pip3='pip3 --user'
# alias pip='pip --user'
alias ls='exa --icons'
alias cat='cat -n'
alias lzy='lazygit'

# setup funky
command -v funky &>/dev/null && eval "$(funky --init bash)"

source /nix/store/04yzk79045lsz22yfkwpd1bc05hvg1pb-autojump-22.5.3/share/autojump/autojump.bash
alias dots='/usr/bin/env git --git-dir=/home/nrdybhu1/.cfg/ --work-tree=/home/nrdybhu1'

# load_theme
nerdfetch
