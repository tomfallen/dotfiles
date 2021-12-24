eval `dircolors ~/.dir_colors/dircolors`

# Save bash history after every command
export PROMPT_COMMAND='history -a'

# Save 100x the default history
HISTSIZE=1000000
HISTFILESIZE=2000000

# Stuff for virtual environment wrapper
# apt version:
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
# pip version:
source ~/.local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/Envs

alias touchpad_restart="sudo rmmod hid_multitouch && sleep 2s && sudo modprobe hid_multitouch"

alias tmux='tmux attach || tmux new'

# Gradle stuff
export PATH=$PATH:/opt/gradle/gradle-5.4/bin

# Golang stuff
export GOPATH=$HOME/go/
export PATH=$PATH:$GOPATH/bin

alias nview="nvim -R"
export DOTFILE_PATH=$HOME/dotfiles
alias sourcebash="source $DOTFILE_PATH/bashrc"
alias vimbash="nvim $DOTFILE_PATH/bashrc"
alias vimvim="nvim $DOTFILE_PATH/vimrc"

alias sgrep='grep -InRs --color=auto \
    --exclude-dir={build,devel,.svn,.git,tags,.ropeproject,externals,venv,site-packages,.pytest_cache,.mypy_cache,node_modules} \
    --exclude={*.log,tags,*.mp4,*.MP4,*.JPG,*.jpg,*.insv,*.insp,*.svg,similarity.c}'

alias mkvenv3='mkvirtualenv -p /usr/bin/python3'

alias sc="time scons -j 4"
alias cm="cmake -j4 ."
alias mk="time make -j4"
alias mkt="time make -j4 && make test && py.test .."

alias sds="source devel/setup.bash"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .....="cd ../../../../.."

alias cpu="watch -n.5 \"cat /proc/cpuinfo | grep MHz\""

alias gts="git status"
alias gtd="git diff"
alias gtdc="git diff --cached"

alias cleanpyc="find . -name '*.pyc' -exec rm --force {} +"

# for executable python scripts
export PATH=$PATH:$HOME/bin  # don't overwrite real binaries

alias rebuild="time rm -rf build && rm -rf devel && mkdir build && cd build && cmake .. && time make -j4"
alias reup="cd .. && rebuild"

alias iipython="ipython -i"
alias ipq="ipython -i --gui=qt"

alias rbd="rm -rf build devel"


# move/remove/copy with backup
# alias tr=trash  # don't do this, tr exists
alias rb="trash"
alias mb="mv --backup=numbered"
alias cb="cp --backup=numbered"

alias cpl="cpplint --recursive --quiet ."

alias cleanswig="find ./ -name "*PYTHON_wrap.cxx" -exec rm -rf {} \;"

# export LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"
# export PATH="/usr/local/cuda/bin:${PATH}"

alias diskusage="du -sh * | sort -h"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tom/google-cloud-sdk/path.bash.inc' ]; then . '/home/tom/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tom/google-cloud-sdk/completion.bash.inc' ]; then . '/home/tom/google-cloud-sdk/completion.bash.inc'; fi

source ~/.bashrc_local

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
