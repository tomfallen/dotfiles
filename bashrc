eval `dircolors ~/.dir_colors/dircolors`

# Stuff for virtual environment wrapper
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/Envs

alias view="vim -R"
export DOTFILE_PATH=$HOME/dotfiles
alias sourcebash="source $DOTFILE_PATH/bashrc"
alias vimbash="vim $DOTFILE_PATH/bashrc"
alias vimvim="vim $DOTFILE_PATH/vimrc"

alias sgrep="grep -InR --color=auto --exclude-dir={build,devel,.svn,.git,tags,.ropeproject,externals,venv,site-packages} --exclude=tags"

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

alias gts="git status"
alias gtd="git diff"

alias cleanpyc="find . -name '*.pyc' -exec rm --force {} +"

# for executable python scripts
export PATH=$PATH:$HOME/bin  # don't overwrite real binaries


export CODE=~/code
export PYTHONPATH=$PYTHONPATH:$CODE/falkor

alias rebuild="time rm -rf build && rm -rf devel && mkdir build && cd build && cmake .. && time make -j4"
alias reup="cd .. && rebuild"

alias iipython="ipython -i"

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
