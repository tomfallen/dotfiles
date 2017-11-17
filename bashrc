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

source /opt/ros/kinetic/setup.bash

alias sourcerobotics=". ~/ros_ws/devel/setup.bash && . ~/ros_ws/src/robotics/venv/bin/activate"
# . ~/ros_ws/devel/setup.bash
# . ~/ros_ws/src/robotics/venv/bin/activate

export HOSTUSER=tallen
alias cdrobotics="cd ~/ros_ws/src/robotics"

alias ckb="catkin build"
alias ckbc="catkin clean -y && catkin build"

alias vpnvic="sudo openvpn --config ~/openvpn/client.ovpn"

# for executable python scripts
export PATH=$PATH:$HOME/bin  # don't overwrite real binaries

# export PYJOCO_MJPRO_PATH=/opt/mujoco/mjpro131
export PYJOCO_MJPRO_PATH=/home/tallen/software/mjpro150
export PYJOCO_MJKEY_PATH=$PYJOCO_MJPRO_PATH/bin/mjkey.txt
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYJOCO_MJPRO_PATH/bin

export MUJOCO_PY_MJPRO_PATH=/opt/mujoco/mjpro131
export MUJOCO_PY_MJKEY_PATH=$MUJOCO_PY_MJPRO_PATH/bin/mjkey.txt

# Hack to try to get pyfreenect2 to link to libfreenect.so
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tallen/ros_ws/devel/lib
# export LIBRARY_PATH=$LIBRARY_PATH:/home/tallen/ros_ws/devel/lib

export CODE=~/code
# export PYTHONPATH=$PYTHONPATH:$CODE/pyjoco
# export PYTHONPATH=$PYTHONPATH:~/code/vgrasp
# export PYTHONPATH=$PYTHONPATH:~/Dropbox/code/kinect

# export CUDA_HOME=/usr/local/cuda
export VICARIOUS=~/vicarious
# export PYTHONPATH=$PYTHONPATH:$CODE/grasp_model
# export PYTHONPATH=$PYTHONPATH:$CODE/rcn3
# export PYTHONPATH=$PYTHONPATH:$CODE/kinematics
# export PYTHONPATH=$PYTHONPATH:$CODE/robot_world

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
