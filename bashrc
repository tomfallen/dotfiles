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

alias sgrep="grep -InR --color=auto --exclude-dir={build,devel,.svn,.git,tags,.ropeproject,externals,venv,site-packages,.pytest_cache} --exclude={*.log,tags}"

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


export CODE=~/code
export FALKOR=$CODE/falkor
export PYTHONPATH=$PYTHONPATH:$FALKOR
export WORKON_FALKOR="workon falkor"

alias cdfalkor="cd $FALKOR"
alias wf=$WORKON_FALKOR
alias lookup="$WORKON_FALKOR && $FALKOR/scripts/backend/lookup.py"
alias caputil="$WORKON_FALKOR && $FALKOR/scripts/backend/capture_util.py index.json"
alias toopy="$WORKON_FALKOR && $FALKOR/scripts/gui/tattoo_gui.py Video_0.mp4 --write-stills"
alias tattoo_create_index="$WORKON_FALKOR && $FALKOR/scripts/backend/capture_util.py --create --base-dir=~/tattoo"
alias analyze="workon ovea && $CODE/ovea/analyze_tracks.py -- --base-dir ~/data/ovea/data_all/captures"

# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
# export WORKON_HOME=~/Envs
# export CODE=~/code
export ATLAS=$CODE/atlas
export PYTHONPATH=$PYTHONPATH:$ATLAS
export WORKON_ATLAS="workon atlas"
alias cdatlas="cd $ATLAS"
alias wa=$WORKON_ATLAS

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
