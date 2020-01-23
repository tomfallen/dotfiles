eval `dircolors ~/.dir_colors/dircolors`

# Save bash history after every command
export PROMPT_COMMAND='history -a'

# Save 10x the default history
HISTSIZE=10000
HISTFILESIZE=20000

# Stuff for virtual environment wrapper
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
export WORKON_HOME=~/Envs

# Gradle stuff
export PATH=$PATH:/opt/gradle/gradle-5.4/bin

alias nview="nvim -R"
export DOTFILE_PATH=$HOME/dotfiles
alias sourcebash="source $DOTFILE_PATH/bashrc"
alias vimbash="nvim $DOTFILE_PATH/bashrc"
alias vimvim="nvim $DOTFILE_PATH/vimrc"

alias sgrep="grep -InRs --color=auto --exclude-dir={build,devel,.svn,.git,tags,.ropeproject,externals,venv,site-packages,.pytest_cache} --exclude={*.log,tags}"

alias sc="time scons -j 4"
alias cm="cmake -j4 ."
alias mk="time make -j4"
alias mkt="time make -j4 && make test && py.test .."

alias sds="source devel/setup.bash"

alias ckb="catkin build"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .....="cd ../../../../.."

alias cpu="cat /proc/cpuinfo | grep MHz"


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

export LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"
export PATH="/usr/local/cuda/bin:${PATH}"

alias diskusage="du -sh * | sort -h"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tom/google-cloud-sdk/path.bash.inc' ]; then . '/home/tom/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tom/google-cloud-sdk/completion.bash.inc' ]; then . '/home/tom/google-cloud-sdk/completion.bash.inc'; fi

source ~/.bashrc_local
